#!/usr/bin/python3
import petl as etl
import pyodbc
with open("/home/student/credentials") as f:
    creds=f.read().rstrip().split("/")
dest = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=tcp:myeducator.database.windows.net;DATABASE=userdata;UID='+creds[0]+';PWD='+ creds[1])

risk = [['risk_level', 'description'],
        [1,             'low'],
        [2,             'medium'],
        [3,             'high']]

etl.tocsv(risk,"/home/student/code/etl/staging/risk.csv")
risk2 = etl.fromcsv("/home/student/code/etl/staging/risk.csv")
etl.todb(risk2,dest,'dim_risk_level')

