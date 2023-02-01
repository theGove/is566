#!/usr/bin/python3
from pprint import pprint
import petl as etl
import pyodbc

with open("/home/student/credentials") as f:
    creds=f.read().rstrip().split("/")

conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=tcp:myeducator.database.windows.net;DATABASE=userdata;UID='+creds[0]+';PWD='+ creds[1])
cursor = conn.cursor()
print("Inserting data into dim_eemployee")

cursor.execute("""
   insert into dim_employee(
      employee_id,
      first_name,
      last_name,
      address,
      city,
      state,
      zip,
      phone,
      title,
      supervisor)
   select
      employee_id,
      first_name,
      last_name,
      address,
      city,
      state,
      zip,
      phone,
      title,
      supervisor
   from u1g0.stage_employee;
""")
conn.commit()
conn.close()

print("Done.")
