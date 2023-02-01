#!/usr/bin/python3
from pprint import pprint
import pyodbc
with open("/home/student/credentials") as f:
    creds=f.read().rstrip().split("/")
conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=tcp:myeducator.database.windows.net;DATABASE=userdata;UID='+creds[0]+';PWD='+ creds[1])


print("----------Build the violation fact table----------")


conn.commit()
conn.close()






























