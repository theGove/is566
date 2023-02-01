#!/usr/bin/python3
import boto3

# Import Key Library
from boto3.dynamodb.conditions import Key

# connect to dynamodb
dynamodb = boto3.resource('dynamodb')

# attach to a table
table = dynamodb.Table('product')

# after building an index at the dynamodb console, query based on the primary key of the index
response = table.query(
    KeyConditionExpression=Key('product_id').eq("6c53d766-b3f3-4f90-b4f4-78edd628b763") 
)

# print results
for line in response['Items']:
    print(line["group"],  line["product_name"], line["unit"])

