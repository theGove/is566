#!/usr/bin/python3
import petl as etl
import cx_Oracle
import pyodbc
with open("/home/student/credentials") as f:
    creds=f.read().rstrip().split("/")
src = cx_Oracle.connect(creds[0] + "/" + creds[1] + "@oracle-sqlgrading.myed-eng.net:1521")
dest = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=tcp:myeducator.database.windows.net;DATABASE=userdata;UID='+creds[0]+';PWD='+ creds[1])

severity = etl.fromdb(src,"""select distinct
  case point_level
   when 'Serious' then 2
   when 'Critical' then 3
   when 'Minor' then 1
   else 0
  end as severity_level,
  point_level as description
from inspection.inspection_point order by severity_level""")

etl.tocsv(severity,"/home/student/code/etl/staging/severe.csv")

#dest.cursor().execute("delete from dim_severity_level")

etl.todb(severity,dest,'dim_severity_level')
