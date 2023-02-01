#!/usr/bin/python3
from decimal import Decimal
import boto3
import time
import csv
import sys
import uuid

# connect to dynamodb
#if not dynamodb:
dynamodb = boto3.resource('dynamodb')

table = dynamodb.Table('customer')

mark=time.perf_counter() # record the time to check to see how long it takes to insert records

file_num=1
if len(sys.argv)>1:
    file_num = sys.argv[1]


line_num=0    
with open('/home/student/data/doterra/customer' + str(file_num) + '.csv' , 'r') as csv_file:

    csv_reader = csv.reader(csv_file, delimiter=',')
    for data in csv_reader:
        one_record={
                'customer_id':str(uuid.uuid4()), 
                'last_name':data[6],
                'first_name':data[4],
                'balance':Decimal(data[1]),
                'gender':data[5],
                'phone':data[7],
                'email':data[3],
                'address':{
                    'street_address':data[0],
                    'city':data[2],
                    'state':data[8],
                    'zip':data[9]
                }    
            }
        #print(one_record)    

        table.put_item(Item=one_record)
        
        line_num +=1

        if line_num % 100 == 0:
            print("Inserted 100 customers in  " + str(round(time.perf_counter()-mark,1)) + " seconds.")        
            mark=time.perf_counter()

        if line_num > 1000:
            break # for class purposes, we are limiting the cusotmers to 1000

