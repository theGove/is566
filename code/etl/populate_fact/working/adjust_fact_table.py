#!/usr/bin/python3
from pprint import pprint
import pyodbc
with open("/home/student/credentials") as f:
    creds=f.read().rstrip().split("/")
conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=tcp:myeducator.database.windows.net;DATABASE=userdata;UID='+creds[0]+';PWD='+ creds[1])



print("----------Build the violation fact table----------")
conn.cursor().execute("""

   IF OBJECT_ID('fact_violation') IS NOT NULL
     drop table fact_violation

   create table fact_violation(
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


conn.commit()
conn.close()
