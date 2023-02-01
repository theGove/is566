#!/usr/bin/python3
import snowflake.connector
import json

# get connected to snowflake
with open('/home/student/code/etl/snowflake/connect/credentials.json') as file:
    creds = json.load(file)    

# Gets connected
ctx = snowflake.connector.connect(
    user=creds["user"],
    password=creds["password"],
    account=creds["locator"]
    )
cur = ctx.cursor()
try:

    # Starting with the Role.
    sql = "USE ROLE SYSADMIN"
    cur.execute(sql)

    sql = "CREATE WAREHOUSE IF NOT EXISTS IS566 WITH WAREHOUSE_SIZE = XSMALL"
    cur.execute(sql)    

    sql = "USE WAREHOUSE IS566"
    cur.execute(sql)

    sql = "CREATE DATABASE IF NOT EXISTS chicago"
    cur.execute(sql)

    sql = "USE DATABASE chicago"
    cur.execute(sql)

    sql = "CREATE SCHEMA IF NOT EXISTS inspection"
    cur.execute(sql)

    sql = "USE SCHEMA inspection"
    cur.execute(sql)

    print("----------Build the violation fact table----------")
    cur.execute("""
    create or replace table fact_violation(
        fact_violation_id int identity(1,1) primary key
        ,fine decimal(3,0)
        ,inspection_type varchar(50)
        ,results varchar(20)
        ,severity_level decimal(1,0)
        ,risk_level decimal(1,0)
        ,ward decimal(2,0)
        ,category varchar(50) NULL
        ,dim_date_key int
        ,dim_inspection_id int
        ,dim_point_id int
        ,dim_establishment_id int
        ,dim_employee_id int
        ,dim_supervisor_id int
    );

    """)


    cur.execute("""
    create or replace table stage_violation(
            inspection_id int NOT NULL,
            point_id int NOT NULL,
            fine decimal(3, 0) NULL,
            inspector_comment varchar(3000) NULL
    );

    """)



    print("----------Build the Inspection staging table----------")

    cur.execute("""
    create or replace table stage_inspection(
            inspection_id int NOT NULL primary key,
            inspection_date date NULL,
            inspection_type varchar(50) NULL,
            results varchar(20) NULL,
            employee_id int NULL,
            license_no int NULL,
            followup_to int NULL);
    """)



    print("----------Build the Employee Dimension----------")
    cur.execute("""
    create or replace table dim_employee(
    dim_employee_id int identity(1,1) primary key
    ,employee_id int
    ,first_name varchar(15)
    ,last_name varchar(15)
    ,address varchar(30)
    ,city varchar(15)
    ,state char(2)
    ,zip char(5)
    ,phone char(14)
    ,title varchar(20)
    ,supervisor int
    );


    """)

    cur.execute("""
    create or replace table stage_employee(
            employee_id int NOT NULL primary key,
            first_name varchar(15) NULL,
            last_name varchar(15) NULL,
            address varchar(30) NULL,
            city varchar(15) NULL,
            state char(2) NULL,
            zip char(5) NULL,
            phone char(14) NULL,
            title varchar(20) NULL,
            salary decimal(6, 0) NULL,
            supervisor int NULL);
    """)

    print("----------Build the Establishment Dimension----------")
    cur.execute("""
    create or replace table dim_establishment(
        dim_establishment_id int identity(1,1) primary key
        ,license_no int
        ,dba_name varchar (100)
        ,aka_name varchar (100)
        ,facility_type varchar (40)
        ,address varchar (50)
        ,city char (7)
        ,state char (2)
        ,zip char (5)
        ,ward decimal(2,0)
        ,latitude decimal (16, 14)
        ,longitude decimal (16, 14)
    );


    """)

    cur.execute("""
    create or replace table stage_establishment(
            license_no int
            ,dba_name varchar(80)
            ,aka_name varchar(50)
            ,facility_type varchar(40)
            ,risk_level decimal(1,0)
            ,address varchar(40)
            ,city char(7)
            ,state char(2)
            ,zip char(5)
            ,latitude decimal(15,13)
            ,longitude decimal(15,13)
            ,ward decimal(2,0)
    );
    """)

    print("----------Build the point Dimension----------")
    cur.execute("""
    create or replace table dim_point(
        dim_point_id int identity(1,1) primary key
        ,point_id int NULL
        ,description varchar(255) NULL
        ,category varchar(50) NULL
        ,code varchar(50) NULL
        ,std_fine decimal(3,0) NULL
    );


    """)
    cur.execute("""
    create or replace table stage_inspection_point(
            point_id int NOT NULL primary key,
            Description varchar(255) NULL,
            category varchar(50) NULL,
            code varchar(50) NULL,
            fine decimal(3, 0) NULL,
            point_level char(8) null)

    """)


    print("----------Build the risk level Dimension----------")
    cur.execute("""
    create or replace table dim_risk_level(
        risk_level decimal(1,0) primary key
        ,description varchar(15) NULL
    );


    """)



    print("----------Build the severity level Dimension----------")
    cur.execute("""
    create or replace table dim_severity_level(
        severity_level decimal(1,0) primary key
        ,description varchar(8) NULL
    );


    """)



    print("----------Build the Date Dimension----------")
    cur.execute("""
    create or replace table dim_date( 
        DateKey INT primary key, 
        Date DATETIME,
        FullDateUK CHAR(10), -- Date in dd-MM-yyyy format
        FullDateUSA CHAR(10),-- Date in MM-dd-yyyy format
        DayOfMonth VARCHAR(2), -- Field will hold day number of Month
        DaySuffix VARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
        DayName VARCHAR(9), -- Contains name of the day, Sunday, Monday 
        DayOfWeekUSA CHAR(1),-- First Day Sunday=1 and Saturday=7
        DayOfWeekUK CHAR(1),-- First Day Monday=1 and Sunday=7
        DayOfWeekInMonth VARCHAR(2), --1st Monday or 2nd Monday in Month
        DayOfWeekInYear VARCHAR(2),
        DayOfQuarter VARCHAR(3),
        DayOfYear VARCHAR(3),
        WeekOfMonth VARCHAR(1),-- Week Number of Month 
        WeekOfQuarter VARCHAR(2), --Week Number of the Quarter
        WeekOfYear VARCHAR(2),--Week Number of the Year
        Month VARCHAR(2), --Number of the Month 1 to 12
        MonthName VARCHAR(9),--January, February etc
        MonthOfQuarter VARCHAR(2),-- Month Number belongs to Quarter
        Quarter CHAR(1),
        QuarterName VARCHAR(9),--First,Second..
        Year CHAR(4),-- Year value of Date stored in Row
        YearName CHAR(7), --CY 2012,CY 2013
        MonthYear CHAR(10), --Jan-2013,Feb-2013
        MMYYYY CHAR(6),
        FirstDayOfMonth DATE,
        LastDayOfMonth DATE,
        FirstDayOfQuarter DATE,
        LastDayOfQuarter DATE,
        FirstDayOfYear DATE,
        LastDayOfYear DATE,
        IsHolidayUSA boolean,-- Flag 1=National Holiday, 0-No National Holiday
        IsWeekday boolean,-- 0=Week End ,1=Week Day
        HolidayUSA VARCHAR(50),--Name of Holiday in US
        IsHolidayUK boolean Null,-- Flag 1=National Holiday, 0-No National Holiday
        HolidayUK VARCHAR(50) Null --Name of Holiday in UK
        );

    """)


finally:
    cur.close()
ctx.close()
