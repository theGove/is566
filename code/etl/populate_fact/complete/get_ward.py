#!/usr/bin/python3
# importing the requests library 
import requests
import json
import pyodbc

def get_ward(address):
    headers = {
        'Connection': 'keep-alive',
        'Accept': 'application/json, text/javascript, */*; q=0.01',
        'Sec-Fetch-Dest': 'empty',
        'Authorization': 'Basic ZWxzX2NsaWVudF93YXJkZ2VvOnR2S0xANFM2N2Fw',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36',
        'Content-Type': 'application/json',
        'Origin': 'https://gisapps.chicago.gov',
        'Sec-Fetch-Site': 'same-site',
        'Sec-Fetch-Mode': 'cors',
        'Referer': 'https://gisapps.chicago.gov/WardGeocode/',
        'Accept-Language': 'en-US,en;q=0.9',
    }

    data = '{ForwardGeocodeServiceInput3:{"systemId":"WARD_LOOKUP","offsetFt":"20","fullAddress":"' + address + '", "getGeos":{"geographyName":"WARD"}}}'

    response = requests.post('https://api.chicago.gov/els/forwardgeocoding/rest/geocode_3', headers=headers, data=data)

    result = json.loads(response.text)
    if result["ForwardGeocodeServiceOutput3"]["cleansingStatus"]=='ACTUAL':
        return result["ForwardGeocodeServiceOutput3"]["geoValues"][0]["geographyValue"]
    else:
        return -1
    

def update_records():
    with open("/home/student/credentials") as f:
        creds=f.read().rstrip().split("/")
    conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=tcp:myeducator.database.windows.net;DATABASE=userdata;UID='+creds[0]+';PWD='+ creds[1])
    cursor = conn.cursor()
    cursor.execute("select top 5 dim_establishment_id, address from U1G0.dim_establishment where ward is null order by NEWID()")
    records = cursor.fetchall()
    if len(records)==0:
        return False
    x=0
    for row in records:
        x=x+1
        print(row[0])
        ward = get_ward(row[1])
        sql = "update U1G0.dim_establishment set ward=" + str(ward) + " where dim_establishment_id=" + str(row[0])
        print (str(x) + ". " + str(row[0]) + " " + row[1] + " ----> " + sql)
        cursor.execute(sql)
        conn.commit()
    return True    

def main():
    while update_records():
        print ("working")

main()
