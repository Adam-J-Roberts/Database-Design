from pymongo import MongoClient
import json
import csv
import configparser

config = configparser.ConfigParser()
config.read('config.ini')
connection_string = config['database']['mongo_connection']

def connect_to_db(conn_str):
    client = MongoClient(conn_str)
    return client

client = connect_to_db(connection_string)

things = client.cmps364.things

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Do not change this.  The print /save
# methods below dump the output
# to this collection.  This allows
# me to grade your work!
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
output = client.cmps364.lab7output
output.drop()

num = things.count({})
if num == 0:
    with open('data.json', 'r') as seed:
        data = seed.read()

    documents = json.loads(data)
    things.insert_many(documents)

num = things.count({})
print("Working with ", num, "things")


# Example - Print the names of all things over $40
pipeline = [
    {'$match': {'price': {'$gte': 40}}},
    {'$project': {'_id': 0, 'name': 1}}
]

results = things.aggregate(pipeline)

for i, thing in enumerate(results):
    print(str(i).rjust(4), thing['name'])
print("-" * 80)


# Problem 4:  For each item, output the number of 5 star ratings it has received.
# Hint:  	  You can group by the concatenation of two fields by constructing an object for the value
#             of _id...  {_id: {a: $field1, b: $field2}}

pipeline = [
    {'$unwind' : '$ratings'},{'$match' : {'ratings': {'$eq' : 5} } },
    {'$group' : { '_id' : {'name' : '$name', 'category' : '$category'}, 'count' : {'$sum' : 1} } }
]

results = things.aggregate(pipeline)

print("-" * 80)
print('Problem 4 Results')
print("-" * 80)
for i, thing in enumerate(results):
	print(str(i).rjust(4), thing['_id']['name'].ljust(20), thing['count'])
	output.insert_one({'problem': 'p4', 'result': thing})
print("-" * 80)

