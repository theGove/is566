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

insert_stmt = session.prepare("insert into doterra.customer (partition_key,customer_id,address,balance,city,email,first_name,gender,last_name,phone,state,zip) values(?,?,?,?,?,?,?,?,?,?,?,?);")
insert_stmt.consistency_level = ConsistencyLevel.ALL
mark=time.perf_counter() # record the time to check to see how long it takes to insert records
line_number = 0           
with open('/home/student/data/doterra/customer'+sys.argv[1]+'.csv' , 'r') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    for data in csv_reader:
        data[1]=float(data[1])
        data.insert(0,uuid.uuid4())
        data.insert(0,str(data[0])[:2])
        # print(data)
        session.execute(insert_stmt, data)
        line_number += 1
        if line_number % 100 == 0:
            print(time.perf_counter()-mark)
            mark=time.perf_counter()

print("done")
session.shutdown()  
