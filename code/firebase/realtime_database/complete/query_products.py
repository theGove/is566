#!/usr/bin/python3
import firebase_admin
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
ref = db.reference("/products/")
#data = ref.order_by_child('retail').equal_to(800).get()
data = ref.order_by_child('retail').start_at(100).end_at(800).get()
for key in data:
    print(key)
    print(data[key])
    print("==========================")

# need to add the following rule to the Realtime DB
#{
#  "rules": {
#    ".read": "now < 1650607200000",  // 2022-4-22
#    ".write": "now < 1650607200000",  // 2022-4-22
#   "products": {
#      ".indexOn": "retail"
#    }
#  }
#}
