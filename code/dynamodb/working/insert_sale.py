#!/usr/bin/python3
import boto3
import json
import random
import sys
import uuid

# Build a table in DynamoDB as follows
#    Name: sale
#    Partition Key: sale_id (string)


# connect to dynamodb
dynamodb = boto3.resource('dynamodb')

# get the set of all customers
print("Getting list of customers")


# get the set of all products, only include the following attributes
# 'product_id','product_name','retail','group','unit'
print("Getting list of products")


table = dynamodb.Table('sale')

def random_customer():
    return customers[random.randint(1, len(customers))-1]

def random_product():
    return products[random.randint(1, len(products))-1]

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
        p=random_product()
        print(p)
        prod_set.add(json.dumps(p))
    
    order_lines = []
    order_total=0
    # add the products to the sale
    for prod in prod_set:
        #print(product_dict)
        qty=random.randint(1, 10)
        product_dict=json.loads(prod)
        print()
        order_total += float(product_dict["retail"]) * qty
        order_lines.append(product_dict)

    one_record={
        'sale_id':str(uuid.uuid4()),
        'customer_id':random_customer()["customer_id"],
        'products':order_lines
    }

    table.put_item(Item=one_record)
    #print(str(sale_ref.id) + ": " + str(order_total))

    
if __name__ == "__main__":
    order_count=100
    if len(sys.argv)==2:
        order_count = int(sys.argv[1])
    for x in range(1, order_count+1):
        print("Now making order number " + str(x) + " of " + str(order_count) + ".")
        make_order()


