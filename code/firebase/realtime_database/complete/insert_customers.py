#!/usr/bin/python3
import firebase_admin
import time
import csv
from firebase_admin import db


# Use a service account
cred = firebase_admin.credentials.Certificate("/home/student/code/firebase/connect/firebase-admin-key.json")

# read in the databseURL.  For this to work, you must update database_url.txt with your DatabaseURL from the realtime database console page
with open('/home/student/code/firebase/connect/databse_url.txt','r') as file:
    databaseURL = file.read()

default_app = firebase_admin.initialize_app(cred, {
	'databaseURL':databaseURL
	})

# open a file to hold the keys generated when pushing data into RTDB
key_file = open("/home/student/data/realtime_db/customer_list.txt","a")

# get a reference to the point in your data tree where you want to insert the data
ref = db.reference("/customers/")

mark=time.perf_counter() 
line_num=0 
with open('/home/student/data/doterra/customer1.csv' , 'r') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    next(csv_reader)
    for data in csv_reader:
        line_num += 1
        print(str(line_num) + ": " + data[4] + " " + data[6])
        # use the db reference to push data in into the database
        doc_ref=ref.push(
          { 
            'address': data[0],
            'balance': float(data[1]),
            'city': data[2],
            'email': data[3],
            'first_name': data[4],
            'gender': data[5],
            'last_name': data[6],
            'phone': data[7],
            'state': data[8],
            'zip': data[9]          
          }
        )
        key_file.write (doc_ref.key)
        key_file.write ("\n")
        if line_num > 99:
          break  
print("Code completed in " + str(round(time.perf_counter()-mark,1)) + " seconds.")        
key_file.close()   


