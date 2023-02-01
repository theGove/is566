#!/usr/bin/python3
import boto3
dynamodb = boto3.resource('dynamodb')

# connect to dynamodb
def main():
    try:
        create_table()
    except: 
        print("Table already exists.")
        pass

    # try to connect to the movies table
    table = dynamodb.Table('movies')

    response = table.scan()
    for movie in response['Items']:
        print(str(movie["year"]) + " " + movie["title"])



def create_table():
    print("Checking to see if table exists . . . ")
    table = dynamodb.create_table(
        TableName='movies',
        KeySchema=[
            {
                'AttributeName': 'year',
                'KeyType': 'HASH'  # Partition key
            },
            {
                'AttributeName': 'title',
                'KeyType': 'RANGE'  # Sort key
            }
        ],
        AttributeDefinitions=[
            {
                'AttributeName': 'year',
                'AttributeType': 'N'
            },
            {
                'AttributeName': 'title',
                'AttributeType': 'S'
            },

        ],
        ProvisionedThroughput={
            'ReadCapacityUnits': 10,
            'WriteCapacityUnits': 10
        }
    )
    print("Creating table and inserting data.  This should take less than a minute.")
    table.meta.client.get_waiter('table_exists').wait(TableName='movies')
    table.put_item(Item={"year" : 1994,"title" : "Shawshank Redemption"})
    table.put_item(Item={"year" : 2003,"title" : "Pirates of the Caribbean: Curse of the Black Pearl"})
    table.put_item(Item={"year" : 1946,"title" : "It's a Wonderful Life"})

main()