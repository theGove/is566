#!/usr/bin/python3
from pprint import pprint
import cx_Oracle
with open("/home/student/credentials") as f:
    creds=f.read()
conn = cx_Oracle.connect(creds.rstrip()+"@oracle-sqlgrading.myed-eng.net:1521")
cursor = conn.cursor()
cursor.execute('SELECT * from redcat.customer where customerid=555')
#process the whole cursor at once
pprint(cursor.fetchall())
conn.close
