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

# get a reference to the point in your data tree where you want to insert the data

mark=time.perf_counter() 
with open('/home/student/data/doterra/product.csv' , 'r') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    next(csv_reader)
    for data in csv_reader:
        print(data[1])
        # use the db reference to push data in into the database
print("Code completed in " + str(round(time.perf_counter()-mark,1)) + " seconds.")                


