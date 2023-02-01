#!/usr/bin/python3
from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider

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

rows = session.execute("select * from is566.employee")
for row in rows:
    print(row[2],row[5],row[6],row[1])

#rows = session.execute("select * from is566.emp")
#for row in rows:
#    print(row[1],row[2],row[3],row[0])
