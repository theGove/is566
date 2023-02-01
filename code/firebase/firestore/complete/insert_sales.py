#!/usr/bin/python3
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import time
import sys
import random


# Use a service account
cred = firebase_admin.credentials.Certificate("/home/student/code/firebase/connect/firebase-admin-key.json")
firebase_admin.initialize_app(cred)

db = firestore.client()


# get the set of products and the product count
print ("Getting Products")
data_file = open("/home/student/data/firebase/product_list.txt","r")
products=data_file.readlines()
data_file.close()


# get the set of customers and the customer count
print ("Getting Customers")
data_file = open("/home/student/data/firebase/customer_list.txt","r")
customers=data_file.readlines()
data_file.close()

def random_customer():
    return customers[random.randint(1, len(customers))-1][:-1]

def random_product():
    return products[random.randint(1, len(products))-1][:-1]

def make_order():
    # choose a customer
    cust = random_customer()

    prod_count = 1

    # calcualte the number of products on the order
    for x in range(1, 5):
       prod_count = prod_count + random.randint(0, 3) 

    prod_set = set([])
    
    # get the product IDs
    for x in range(1, prod_count):
        prod_set.add(random_product())

    sale_ref = db.collection('customer').document(cust).collection("sales").document()   
    
    
    order_lines = []
    order_total=0
    # add the products to the sale
    for prod in prod_set:
        product_dict = db.collection('product').document(prod).get().to_dict()
        #print(product_dict)
        qty=random.randint(1, 10)
        order_total += product_dict["retail"] * qty
        order_lines.append({
            "product_id":prod,
            "product_name":product_dict["product_name"],
            "price":product_dict["retail"],
            "qty":qty,
        })

    sale_ref.set({
        "created": firestore.SERVER_TIMESTAMP,
        "lines":order_lines,
        "total":round(order_total,2)

    })        
    print(str(sale_ref.id) + ": " + str(order_total))

    
if __name__ == "__main__":
    mark=time.perf_counter() 
    order_count=100
    if len(sys.argv)==2:
        order_count = int(sys.argv[1])
    for x in range(1, order_count+1):
        print("Now making order number " + str(x) + " of " + str(order_count) + ".")
        make_order()
    print("Code completed in " + str(round(time.perf_counter()-mark,1)) + " seconds.")        


