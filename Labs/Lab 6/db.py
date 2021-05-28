import pymongo
from pymongo import MongoClient
import csv
import configparser

#######################################################################
# IMPORTANT:  You must set your config.ini values!
#######################################################################
# The connection string is provided by mlab.  Log into your account and copy it into the 
# config.ini file.  It should look something like this:
# mongodb://labs:test@ds213239.mlab.com:13239/cmps364
# Make sure you copy the entire thing, exactly as displayed in your account page!
#
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Please make sure your database is named cmps 364
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
#######################################################################
config = configparser.ConfigParser()
config.read('config.ini')
connection_string = config['database']['mongo_connection']


ships = None
classes = None

def load_data():
    classes = list()
    with open('classes.csv', newline='') as csvfile:
        spamreader = csv.reader(csvfile)
        for row in spamreader:
            classes.append(row)

    ships = list()
    with open('ships.csv', newline='') as csvfile:
        spamreader = csv.reader(csvfile)
        for row in spamreader:
            ships.append(row)
    return [classes, ships]


def seed_database():
    existing = classes.find({})

    if existing.count() < 1:
        print("here")
        data = load_data()
        classes_list = data[0]
        ships_list = data[1]
        for cl in classes_list:
            add_class(cl)
        for sh in ships_list:
            add_ship(sh)
    else:
        print("Seed data already loaded")
    # If there is already data, there is no need to do anything at all...

# utility lists defining the fields, and the order they are expected to be in by ui.py
class_keys = ('class', 'type', 'country', 'guns', 'bore', 'displacement')
ship_keys = ('class', 'name', 'launched')


# utility function you might find useful.. accepts a key list (see above) and 
# a document returned by pymongo (dictionary) and turns it into a list.     
def to_list(keys, document):
    record = []
    for key in keys:
        record.append(document[key])
    return record  

# utility function you might find useful...  Similar to to_list above, but it's appending
# to a list (record) instead of creating a new one.  Useful for when you already have a
# list, but need to join another dictionary object into it...
def join(keys, document, record):
    for key in keys:
        record.append(document[key])
    return record  
    

# Return list of all classes.  Important, to receive full credit you
# should use a Python generator to yield each item out of the cursor.
# Field order should be class, type, country, guns, bore, displacement
# -- Remember, pymongo returns a dictionary, so you need to transform it into a list!
def get_classes():
    for cl in classes.find({}):
        class_list = to_list(class_keys, cl)
        yield class_list


# Return list of all ships, joined with class.  Important, to receive full credit you
# should use a Python generator to yield each item out of the cursor.
# Field order should be ship.class, name, launched, class.class, type, country, guns, bore, displacement
# If class_name is not None, only return ships with the given class_name.  Otherwise, return all ships
def get_ships(class_name):
    #result = []
    
    if class_name is not None:
        existing = ships.find({ 'class' : class_name })
    else:
        existing = ships.find({})
        
    for sh in existing:
            ship_list = to_list(ship_keys, sh)
            matching = classes.find({'class':ship_list[0]})
            for each in matching:
                result = join(class_keys, each, ship_list)
                yield result


# Data will be a list ordered with class, type, country, guns, bore, displacement.
def add_class(data):
    classes.insert_one({class_keys[0] : data[0], class_keys[1] : data[1], class_keys[2] : data[2], class_keys[3] : data[3], class_keys[4] : data[4], class_keys[5] : data[5]})

# Data will be a list ordered with class, name, launched.
def add_ship(data):
    ships.insert_one({ship_keys[0] : data[1], ship_keys[1] : data[0], ship_keys[2] : data[2]})


def delete_class(class_name):
    classes.delete_many({ 'class' : class_name })

def delete_ship(ship_name, class_name):
    ships.delete_many({ 'class' : class_name, 'name' : ship_name})

# This is called at the bottom of this file.  You can re-use this important function in any python program
# that uses mongodb.  The connection string parameter comes from the config.json file in this
# particular example.

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Please make sure your database is named cmps 364
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
def connect_to_db(conn_str):
    global classes
    global ships
    client = MongoClient(conn_str)
    classes = client.cmps364.classes
    ships = client.cmps364.ships
    return client

# This establishes the connection, conn will be used across the lifetime of the program.
conn = connect_to_db(connection_string)
seed_database()