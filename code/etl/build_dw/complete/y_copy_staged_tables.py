#!/usr/bin/python3

# this script is provided for quick duplication of data on the MS SQL Server for classroom exercises. 
# It in not part of what what would be in production
# This script just copies the staged data from the instructor's account to the student account.

import pyodbc


def copy_staged_table(table_name, conn):
    cursor = conn.cursor()
    cursor.execute("delete from stage_" + table_name + ";insert into stage_" + table_name + " select * from u1g0.stage_" + table_name)
    cursor.execute("select  count(*) as recordCount from stage_" + table_name)
    print (table_name + ": " + str(cursor.fetchone()[0]))

def main():
    with open("/home/student/credentials") as f:
        creds=f.read().split("/")
    server = 'tcp:myeducator.database.windows.net'
    database = 'userdata'
    username = creds[0]
    password = creds[1].split('\n')[0]
    cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)

    copy_staged_table ("inspection_point", cnxn)
    copy_staged_table ("employee", cnxn)
    copy_staged_table ("establishment", cnxn)
    copy_staged_table ("inspection", cnxn)
    copy_staged_table ("violation", cnxn)

main()

