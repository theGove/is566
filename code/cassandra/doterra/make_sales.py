#!/usr/bin/python3
from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider
import random
import time
import sys

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

# get the set of customers and the customer count
print ("Getting Customers")
customer_count = session.execute("select count(*) as the_count from doterra.customer").one().the_count  
print ("customer count:" + str(customer_count))
customers = session.execute("select customer_id from doterra.customer")

# get the set of products and the product count
print ("Getting Products")
product_count = session.execute("select count(*) as the_count from doterra.product").one().the_count  
print ("product count:" + str(product_count))
products = session.execute("select product_id from doterra.product")

# prepare the insert statement template
insert_stmt = session.prepare("insert into doterra.sale(id, customer_id,order_date, product_id,category, product_name, size, price, quantity,amount) values(uuid(),?,?,?,?,?,?,?,?,?);")

def random_customer():
    return customers[random.randint(1, customer_count)-1].customer_id

def random_product():
    return products[random.randint(1, product_count)-1].product_id

def make_order():
    
    # choose a customer
    cust = random_customer()

    prod_count = 1

    # pick a time
    order_time = int(str(random.randint(int(time.time()-(3 * 31535000)), int(time.time())))+"000")

    # calcualte the number of products on the order
    for x in range(1, 5):
       prod_count = prod_count + random.randint(0, 3) 

    prod_set = set([])
    
    # get the product IDs
    for x in range(1, prod_count):
        prod_set.add(random_product())
        #print(rows.one().product_id)

    for prod in prod_set:
        rows = session.execute("select * from doterra.product where product_id = " + str(prod))
        qty=random.randint(1,20)
        data=[cust,order_time, prod, rows.one().category,rows.one().product_name,rows.one().unit,rows.one().retail,qty,rows.one().retail * qty]
        session.execute(insert_stmt, data)

if __name__ == "__main__":
    order_count=10
    if len(sys.argv)==2:
        order_count = int(sys.argv[1])
    for x in range(1, order_count+1):
        print("Now making order number " + str(x) + " of " + str(order_count) + ".")
        make_order()
    session.shutdown()    

