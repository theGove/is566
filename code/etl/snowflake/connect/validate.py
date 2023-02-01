#!/usr/bin/python3
import snowflake.connector
import json

# read credentials file
with open('/home/student/code/etl/snowflake/connect/credentials.json') as file:
    creds = json.load(file)    

# Gets connected
ctx = snowflake.connector.connect(
    user=creds["user"],
    password=creds["password"],
    account=creds["locator"]
    )
cs = ctx.cursor()

try:
    # Gets the version
    cs.execute("SELECT current_version()")
    one_row = cs.fetchone()
    print(one_row[0])
finally:
    cs.close()
ctx.close()
