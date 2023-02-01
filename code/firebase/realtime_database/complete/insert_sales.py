#!/usr/bin/python3
import firebase_admin
from firebase_admin import db
import time
import csv
import sys
import random


# Use a service account
cred = firebase_admin.credentials.Certificate("/home/student/code/firebase/connect/firebase-admin-key.json")

# read in the databseURL.  For this to work, you must update database_url.txt with your DatabaseURL from the realtime database console page
with open('/home/student/code/firebase/connect/databse_url.txt','r') as file:
    databaseURL = file.read()

default_app = firebase_admin.initialize_app(cred, {
	'databaseURL':databaseURL
	})    

# get the set of products and the product count
print ("Getting Products")
data_file = open("/home/student/data/realtime_db/product_list.txt","r")
products=data_file.readlines()
data_file.close()


# get the set of customers and the customer count
print ("Getting Customers")
data_file = open("/home/student/data/realtime_db/customer_list.txt","r")
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
      
    sale_ref = db.reference("/sales/")
    order_lines = []
    order_total=0

    # add the products to the sale
    for prod in prod_set:
        product_dict=db.reference("/products/" + prod).get()
        qty=random.randint(1, 10)
        order_total += product_dict["retail"] * qty
        order_lines.append({
            "product_id":prod,
            "product_name":product_dict["product_name"],
            "price":product_dict["retail"],
            "qty":qty,
        })
    sale_time=time.time()    
    # full sale record    
    new_sale=sale_ref.push(
        { "created": sale_time,
        "lines":order_lines,
        "total":round(order_total,2),
        "customer": cust
        }
    )        
    
    print(str(new_sale.key) + ": " + str(round(order_total,2)))

    # add sale to customers
    cust_ref = db.reference("/customers/" + cust + "/sales/" +new_sale.key)
    cust_ref.set(sale_time)

    
if __name__ == "__main__":
    mark=time.perf_counter() 
    order_count=100
    if len(sys.argv)==2:
        order_count = int(sys.argv[1])
    for x in range(1, order_count+1):
        print("Now making order number " + str(x) + " of " + str(order_count) + ".")
        make_order()
    print("Code completed in " + str(round(time.perf_counter()-mark,1)) + " seconds.")        


