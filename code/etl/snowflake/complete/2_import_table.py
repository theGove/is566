#!/usr/bin/python3
import snowflake.connector
import json
import petl as etl
import cx_Oracle

# get connected to data source
with open("/home/student/credentials") as f:
    creds=f.read().rstrip().split("/")
src = cx_Oracle.connect(creds[0] + "/" + creds[1] + "@oracle-sqlgrading.myed-eng.net:1521")

sql="""
    select *
    from inspection.employee
"""

table = etl.fromdb(src,sql)

# get connected to snowflake
with open('/home/student/code/etl/snowflake/connect/credentials.json') as file:
    creds = json.load(file)    

# Gets connected
ctx = snowflake.connector.connect(
    user=creds["user"],
    password=creds["password"],
    account=creds["locator"],
    warehouse="IS566",
    database="chicago",
    schema="inspection"
    )
cur = ctx.cursor()
try:
    
    for x in range(1,len(table)):
        print(x)
        cur.execute("insert into stage_employee (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY, SUPERVISOR) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",table[x])

finally:
    cur.close()
ctx.close()
