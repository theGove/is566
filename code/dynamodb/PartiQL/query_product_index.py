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
    IndexName="group-retail-index",
    KeyConditionExpression=Key('group').eq("Spa")
)

# print results
for line in response['Items']:
    print(line["group"],  line["product_name"], line["unit"], line["retail"])

