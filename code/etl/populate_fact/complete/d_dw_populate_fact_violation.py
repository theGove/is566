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
   select
    sv.fine, inspection_type, results, dsl.severity_level, risk_level, se.ward, dp.category,
    year(inspection_date)*10000 + month(inspection_date) * 100 + day(inspection_date) as dim_date_id,
      dim_point_id, dim_establishment_id,
      demp2.dim_employee_id,
      demp.dim_employee_id as dim_supervisor_id
  from   u1g0.stage_violation sv
  left outer join u1g0.stage_inspection si
    on si.inspection_id = sv.inspection_id
  left outer join u1g0.stage_inspection_point sip
    on sip.point_id = sv.point_id
  left outer join dim_severity_level dsl
    on dsl.description = sip.point_level
  left outer join u1g0.stage_establishment se
    on se.license_no = si.license_no
  left outer join dim_point dp
    on dp.point_id = sv.point_id
  left outer join dim_establishment de
    on de.license_no = se.license_no
  left outer join u1g0.stage_employee semp
    on semp.employee_id = si.employee_id
  left outer join .dim_employee demp
    on demp.employee_id = semp.supervisor
  left outer join dim_employee demp2
    on demp2.employee_id = si.employee_id
""")
conn.commit()
conn.close()

print("Done.")
