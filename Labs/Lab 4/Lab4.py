import psycopg2
import psycopg2.extras
from urllib.parse import urlparse, uses_netloc
import configparser

#Load database from config.ini
config = configparser.ConfigParser()
config.read('config.ini')
connection_string = config['database']['postgres_connection']

uses_netloc.append("postgres")
url = urlparse(connection_string)

with psycopg2.connect(database=url.path[1:], user=url.username, password=url.password, host=url.hostname, port=url.port) as conn:
    with conn.cursor() as cursor:
        dict_cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cursor.execute("SELECT ID, Name FROM Customers;")
        print("------ Customers -----------------------------------------------------")
        for name in cursor:
            print("%5s %31s" % (name[0], name[1]))

        selection = input("Enter a customer ID:  ")
        print("\n------ Purchase History-----------------------------------------------\n  Serial #  |   Price  |       Manufactuer\n----------------------------------------------------------------------")
        
        cursor.execute("SELECT Orders.serialnumber, Price, Manufacturers.Name FROM Orders \
        JOIN Machines ON Machines.serialNumber = Orders.serialNumber \
        Join Models ON Models.id = Machines.modelNumber \
        JOIN Manufacturers ON Manufacturers.id = Models.manufacturerid \
        WHERE Orders.customerid = %s ;", (selection) )
        for orders in cursor:
            print("%10s %11s %19s" % (orders[0], orders[1], orders[2] ) )
        print("----------------------------------------------------------------------")

        cursor.execute("Select COUNT(Orders.serialnumber), Sum(Price) FROM Orders \
        JOIN Machines ON Machines.serialNumber = Orders.serialNumber \
        Join Models ON Models.id = Machines.modelNumber \
        JOIN Manufacturers ON Manufacturers.id = Models.manufacturerid \
        WHERE Orders.customerid = %s ;", (selection) )
        for totals in cursor:
            print("Total machines purchased:%4s\nTotal money spent:%16s" %(totals[0], totals[1]))


