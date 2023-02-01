#!/usr/bin/python3
from decimal import Decimal
import time
import csv
import sys
import uuid

# Build a table in DynamoDB as follows
#    Name: product
#    Partition Key: product_id (string)
#    Sort Key: product_name (string)


# import dynamodb library

# connect to dynamodb

# attach to a table


mark=time.perf_counter() # record the time to check to see how long it takes to insert records

file_num=1
if len(sys.argv)>1:
    file_num = sys.argv[1]

print("Successfully connected. Now inserting products. Stand by...")
line_num=0    
with open('/home/student/data/doterra/product.csv' , 'r') as csv_file:

    csv_reader = csv.reader(csv_file, delimiter=',')
    next(csv_reader)
    for data in csv_reader:
        one_record={
                'product_id':str(uuid.uuid4()), 
                'product_name':data[1],
                'group':data[0],
                'unit':data[3],
                'wholesale':data[4],
                'retail':data[2]
            }
        print(one_record)    

        # insert record into table
        
        
        line_num +=1

        if line_num % 100 == 0:
            print("Inserted 100 products in  " + str(round(time.perf_counter()-mark,1)) + " seconds.")        
            mark=time.perf_counter()


