#!/usr/bin/python3
import boto3

# Import Key Library
from boto3.dynamodb.conditions import Key

# connect to dynamodb
dynamodb = boto3.resource('dynamodb')

# attach to a table
table = dynamodb.Table('product')

# query records based on the primary key
response = table.query(
    KeyConditionExpression=Key('product_id').eq("0875c7b7-402d-4eb2-8645-5e98cdc10da7") 
)

# print results
for line in response['Items']:
    print(line)
