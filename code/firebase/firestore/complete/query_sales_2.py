#!/usr/bin/python3
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Use a service account
cred = firebase_admin.credentials.Certificate("/home/student/code/firebase/connect/firebase-admin-key.json")
firebase_admin.initialize_app(cred)

db = firestore.client()


query = db.collection_group('sales').where('lines.0.price', '>', 100);

for doc in query.stream():
    print(f'{doc.id} => {doc.to_dict()}')


