#!/usr/bin/python3
from pprint import pprint
import petl as etl
import pyodbc

with open("/home/student/credentials") as f:
    creds=f.read().rstrip().split("/")

conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=tcp:myeducator.database.windows.net;DATABASE=userdata;UID='+creds[0]+';PWD='+ creds[1])

cursor = conn.cursor()
print("Inserting data into dim_establishment")


cursor.execute("""
   insert into dim_establishment(
     license_no,
     dba_name,
     aka_name,
     facility_type,
     address,
     city,
     state,
     zip,
     latitude,
     longitude)
   select license_no,
          dba_name,
          aka_name,
          facility_type,
          address,
          city,
          state,
          zip,
          latitude,
          longitude
    from u1g0.stage_establishment;
""")
conn.commit()
conn.close()

print("Done.")
