#!/usr/bin/python3
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import time
import csv
import sys


# Use a service account
cred = firebase_admin.credentials.Certificate("/home/student/code/firebase/connect/firebase-admin-key.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

mark=time.perf_counter() # record the time to check to see how long it takes to insert records
file_num=1
if len(sys.argv)>1:
    file_num = sys.argv[1]

# open a reference to a local file to keep track of the customer IDs that get created
customers = open("/home/student/data/firebase/customer_list.txt","a")

line_num=0    
with open('/home/student/data/doterra/customer' + str(file_num) + '.csv' , 'r') as csv_file:

    csv_reader = csv.reader(csv_file, delimiter=',')
    for data in csv_reader:
        print(data[4] + ' ' + data[6])
        doc_ref = db.collection('customer').document()
        doc_ref.set({
            'address': data[0],
            'balance': data[1],
            'city': data[2],
            'email': data[3],
            'first_name': data[4],
            'gender': data[5],
            'last_name': data[6],
            'phone': data[7],
            'state': data[8],
            'zip': data[9]            
        })

        customers.write (doc_ref.id)
        customers.write ("\n")

        line_num +=1

        if line_num % 100 == 0:
            print("Inserted 100 customers in  " + str(round(time.perf_counter()-mark,1)) + " seconds.")        
            mark=time.perf_counter()

        if line_num > 100:
            break # for class purposes, we are limiting the cusotmers to 100

customers.close()            


