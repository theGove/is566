#!/usr/bin/python3
from pprint import pprint
import petl as etl
import cx_Oracle
import pyodbc

with open("/home/student/code/etl/year.txt") as f:
    import_year=f.read()

with open("/home/student/credentials") as f:
    creds=f.read().rstrip().split("/")
src = cx_Oracle.connect(creds[0] + "/" + creds[1] + "@oracle-sqlgrading.myed-eng.net:1521")
dest = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=tcp:myeducator.database.windows.net;DATABASE=userdata;UID='+creds[0]+';PWD='+ creds[1])

print("Reading data from source")

table = etl.fromdb(src,"""
    select
      POINT_ID,
      DESCRIPTION,
      CATEGORY,
      CODE,
      FINE,
      POINT_LEVEL
    from inspection.inspection_point
""")

#pprint(table);

print("Write data to stage inspection_point")
etl.todb(table, dest,'stage_inspection_point')
print("Done.")

