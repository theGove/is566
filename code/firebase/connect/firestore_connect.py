#!/usr/bin/python3
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Use a service account
cred = firebase_admin.credentials.Certificate("/home/student/code/firebase/connect/firebase-admin-key.json")
firebase_admin.initialize_app(cred)

db = firestore.client()
doc_ref = db.collection('users').document('nickie')
doc_ref.set({
    'first': 'Nickie',
    'last': 'Allen',
    'born': 1968
})
