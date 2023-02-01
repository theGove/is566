#!/usr/bin/python3
# convert address to ward https://gisapps.chicago.gov/WardGeocode/
# convert curl to python https://curl.trillworks.com/

def get_ward(address):
    import requests
    import json
    headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ZWxzX2NsaWVudF93YXJkZ2VvOnR2S0xANFM2N2Fw',
    }

    data = '{ForwardGeocodeServiceInput3:{"systemId":"WARD_LOOKUP","offsetFt":"20","fullAddress":"' + address + '", "getGeos":{"geographyName":"WARD"}}}'
    response = requests.post('https://api.chicago.gov/els/forwardgeocoding/rest/geocode_3', headers=headers, data=data)
    result = json.loads(response.text)
    #print(result)
    try:
        return result["ForwardGeocodeServiceOutput3"]["geoValues"][0]["geographyValue"]
    except:
        return "-1"


def update_ward():
    import pyodbc
    with open("/home/student/credentials") as f:
        creds=f.read().split("/")
    server = 'tcp:myeducator.database.windows.net'
    database = 'userdata'
    username = creds[0]
    password = creds[1].split('\n')[0]
    cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
    cursor = cnxn.cursor()
    cursor.execute("SELECT top 5 * from dim_establishment where ward is null order by newid()")
    rows = cursor.fetchall()

    if len(rows)==0:
        return False

    for row in rows:
        ward = get_ward(str(row[5]))
        print (row[5], ward )
        cursor.execute("update dim_establishment set ward =" + ward  + "  where dim_establishment_id = " + str(row[0]))
        cnxn.commit()
    return True


while update_ward():
  print("working")
