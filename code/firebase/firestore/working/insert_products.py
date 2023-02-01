#!/usr/bin/python3
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import time
import csv


mark=time.perf_counter() # record the time to check to see how long it takes to insert records

# Use a service account
cred = firebase_admin.credentials.Certificate("/home/student/code/firebase/connect/firebase-admin-key.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

mark=time.perf_counter() 
with open('/home/student/data/doterra/product.csv' , 'r') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    next(csv_reader)
    for data in csv_reader:
        print(data[1])

print("Code completed in " + str(round(time.perf_counter()-mark,1)) + " seconds.")        