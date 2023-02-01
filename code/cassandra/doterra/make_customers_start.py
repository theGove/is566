#!/usr/bin/python3
from cassandra import ConsistencyLevel
from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider
import uuid
import csv
import sys
import time

with open('/home/student/code/cassandra/connect/GeneratedToken.csv') as f:
    creds=f.readlines()[1].split('"')
    clientID=creds[1]
    secret=creds[3]


cloud_config= {
        'secure_connect_bundle': '/home/student/code/cassandra/connect/secure-connect.zip'
}

auth_provider = PlainTextAuthProvider(clientID, secret)
cluster = Cluster(cloud=cloud_config, auth_provider=auth_provider)
session = cluster.connect()
session.execute("insert into doterra.customer (partition_key,customer_id,address,balance,city,email,first_name,gender,last_name,phone,state,zip) values('33',uuid(),'49 Glendale Pass',2938,'Grand Forks','ekarlsson1c@wunderground.com','Erhart','Male','Karlsson','701-572-6822','ND','58207');")

print("done")
session.shutdown()  
