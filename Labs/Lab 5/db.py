import psycopg2
import csv
from urllib.parse import urlparse, uses_netloc
import configparser

#######################################################################
# IMPORTANT:  You must set your config.ini values!
#######################################################################
# The connection string is provided by elephantsql.  Log into your account and copy it into the 
# config.ini file.  It should look something like this:
# postgres://vhepsma:Kdcads89DSFlkj23&*dsdc-32njkDSFS@foo.db.elephantsql.com:7812/vhepsma
# Make sure you copy the entire thing, exactly as displayed in your account page!
#######################################################################
config = configparser.ConfigParser()
config.read('config.ini')
connection_string = config['database']['postgres_connection']

#  You may use this in seed_database.  The function reads the CSV files
#  and returns a list of lists.  The first list is a list of classes, 
#  the secode list is a list of ships.
def load_seed_data():
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
    cursor = conn.cursor()
    # When a class is deleted, you must ensure that all ships from that class are also deleted, using the appropriate deletion cascading policy
    cursor.execute('DROP TABLE IF EXISTS Ship')
    cursor.execute('DROP TABLE IF EXISTS Class')
    cursor.execute('CREATE TABLE Class (Class text PRIMARY KEY, Type text, Country text, NumGuns int, Bore real, Displacement int);')
    cursor.execute('CREATE TABLE Ship (Name text PRIMARY KEY, Class text, launched int, CONSTRAINT Fk_Class FOREIGN KEY(Class) REFERENCES Class(Class) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED);')

    # check if table is empty
    cursor.execute('SELECT COUNT(*) FROM Ship')
    result = cursor.fetchone()
    if result[0] == 0:
        # populate db
        seed_list = load_seed_data()
        # 0 is classes is 1 is ships for seed_list
        for elem in seed_list[0]:
            cursor.execute('INSERT INTO Class (Class, Type, Country, NumGuns, Bore, Displacement) values (%s, %s, %s, %s, %s, %s);', (elem[0], elem[1], elem[2], elem[3], elem[4], elem[5]))
        for elem in seed_list[1]:
            cursor.execute('INSERT INTO Ship(Name, Class, launched) values(%s, %s, %s);', (elem[0], elem[1], elem[2]))
    conn.commit()
    # you must create the necessary tables, if they do not already exist.
    # BE SURE to setup the necessary foreign key constraints such that deleting
    # a class results in all ships of that class being removed automatically.

    # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # Make sure you name your tables and columns EXACTLY as specified
    # in the assignment document.  Failure to do so will result in a minimum
    # of 30 points off your grade!
    # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    # after ensuring the tables are present, count how many classes there are. 
    # if there are none, then call load_data to get the data found in config.json.
    # Insert the data returned from load_data.  Hint - it returns a tuple, with the first being a list
    # of tuples representing classes, and the second being the list of ships.  Carefully
    # examine the code or print the returned data to understand exactly how the data is structured
    # i.e. column orders, etc.

    # If there is already data, there is no need to do anything at all...

# Return list of all classes.  Important, to receive full credit you
# should use a Python generator to yield each item out of the cursor.
# Column order should be class, type, country, guns, bore, displacement
def get_classes():
    cursor = conn.cursor()
    cursor.execute('Select * from Class')
    for classes in cursor:
        yield classes 
    cursor.commit() 
     
# Return list of all ships, joined with class.  Important, to receive full credit you
# should use a Python generator to yield each item out of the cursor.
# Column order should be ship.class, name, launched, class.class, type, country, guns, bore, displacement
# If class_name is not None, only return ships with the given class_name.  Otherwise, return all ships
def get_ships(class_name):
    cursor = conn.cursor()
    if class_name is not None:
        cursor.execute("SELECT * FROM Ship JOIN Class ON Ship.Class = Class.Class WHERE Ship.Class = %s;", (class_name,))
        for ships in cursor:
            yield ships

# Data will be a list ordered with class, type, country, guns, bore, displacement.
def add_class(data):
    cursor = conn.cursor()
    cursor.execute('INSERT INTO Class (Class, Country, NumGuns, Bore, Displacement) values (%s, %s, %d, %f, %f)', (data[0], data[1], int(data[2]), float(data[3]), float(data[4])))
    cursor.commit()

# Data will be a list ordered with class, name, launched.
def add_ship(data):
    cursor = conn.cursor()
    cursor.execute('INSERT INTO Ship (Name, Class, Launched) values (%s, %s, %s)', (data[0], data[1], data[2]))
    cursor.commit()   

# Delete class with given class name.  Note while there should only be one
# SQL execution, all ships associated with the class should also be deleted.
def delete_class(class_name):
    cursor = conn.cursor()
    cursor.execute('Delete from Class where Class == %s', (class_name)) 
    cursor.commit()      

# Delets the ship with the given class and ship name.
def delete_ship(ship_name, class_name):
    cursor = conn.cursor()
    cursor.execute('Delete from Ship where Name == %s and Class == %s', (ship_name, class_name))
    cursor.commit()       



# This is called at the bottom of this file.  You can re-use this important function in any python program
# that uses psychopg2.  The connection string parameter comes from the config.ini file in this
# particular example.  You do not need to edit this code.
def connect_to_db(conn_str):
    uses_netloc.append("postgres")
    url = urlparse(conn_str)

    conn = psycopg2.connect(database=url.path[1:],
        user=url.username,
        password=url.password,
        host=url.hostname,
        port=url.port)

    return conn

# This establishes the connection, conn will be used across the lifetime of the program.
conn = connect_to_db(connection_string)
seed_database()

test = get_ships('Tennessee')
for i in test:
    print(i)