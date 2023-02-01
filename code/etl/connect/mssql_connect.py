#!/usr/bin/python3
import pyodbc
with open("/home/student/credentials") as f:
    creds=f.read().split("/")
    print (creds)
server = 'tcp:myeducator.database.windows.net'
database = 'userdata'
username = creds[0]
password = creds[1].split('\n')[0]
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()
cursor.execute("SELECT * from redcat.customer;")
row = cursor.fetchone()
while row:
    print (str(row[0]) + " " + str(row[1]) + " " + str(row[2]))
    row = cursor.fetchone()
