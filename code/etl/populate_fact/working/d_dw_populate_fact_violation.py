#!/usr/bin/python3
import pyodbc

with open("/home/student/credentials") as f:
    creds=f.read().rstrip().split("/")
conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=tcp:myeducator.database.windows.net;DATABASE=userdata;UID='+creds[0]+';PWD='+ creds[1])
cursor = conn.cursor()
print("Inserting data into fact_violation")
 
cursor.execute("""
   insert into fact_violation(
    fine,
    inspection_type,
    results,
    severity_level,
    risk_level,
    ward,
    category,
    dim_date_key,
    dim_point_id,
    dim_establishment_id,
    dim_employee_id,
    dim_supervisor_id)
   select . . .
 
""")
conn.commit()
conn.close()
 
print("Done.")