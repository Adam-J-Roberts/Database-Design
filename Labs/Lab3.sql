Lab 3
Adam Roberts and Jennifer Haber
Feb 17, 2020

CREATE TABLE Orders (
	Order_number Int PRIMARY KEY,
	Date_of_order Date,
	Customer_ID Int,
	Serial_Number Text
);
CREATE TABLE Customers (
	ID Int PRIMARY KEY,
    Name Text,
	Phone_Number Text,
	Street Text,
	City Text,
	State Text,
	Zip Int
);
CREATE TABLE Machines (
	Serial_Number Text PRIMARY KEY,
	Model_Number Text
);
CREATE TABLE Model(
	ID Int PRIMARY KEY,
	Speed REAL,
	RAM Int,
	HD Int,
	Price Int,
	Manufacturer_ID INT
);
CREATE TABLE Manufacturer(
	ID Int PRIMARY KEY,
	Name Text,
	Phone_Number Text,
	Email_Address Text
);

INSERT INTO Orders(Order_number, Date_of_order, Customer_ID, Serial_Number) VALUES (1, "2001-01-01", 10, 201);
INSERT INTO Orders(Order_number, Date_of_order, Customer_ID, Serial_Number) VALUES (2, "2011-02-01", 11, 202);
INSERT INTO Orders(Order_number, Date_of_order, Customer_ID, Serial_Number) VALUES (3, "2014-01-05", 12, 203);
INSERT INTO Orders(Order_number, Date_of_order, Customer_ID, Serial_Number) VALUES (4, "2012-03-01", 13, 204);
INSERT INTO Orders(Order_number, Date_of_order, Customer_ID, Serial_Number) VALUES (5, "2007-01-14", 14, 205); 
INSERT INTO Customers(ID, Name, Phone_Number, Street, City, State, Zip) VALUES (10, "Janice", "201-742-5315", "505 Ramapmo Valley Road", "Springfield", "NJ", 94252);
INSERT INTO Customers(ID, Name, Phone_Number, Street, City, State, Zip) VALUES (11, "Alex", "952-253-6934", "123 Market Street", "Springfield", "OK", 98376);
INSERT INTO Customers(ID, Name, Phone_Number, Street, City, State, Zip) VALUES (12, "Nessie", "146-262-6583", "Insert Address Ave", "Springfield", "NY", 85432);
INSERT INTO Customers(ID, Name, Phone_Number, Street, City, State, Zip) VALUES (13, "Bravehart", "125-735-1976", "Not Your Home Street", "Springfield", "PA", 02683);
INSERT INTO Customers(ID, Name, Phone_Number, Street, City, State, Zip) VALUES (14, "Dennis", "646-273-7583", "1 Infinite Loop", "Springfield", "CA", 59262);
INSERT INTO Machines(Serial_Number, Model_Number) VALUES ("201", "MODEL101");
INSERT INTO Machines(Serial_Number, Model_Number) VALUES ("202", "MODEL202");
INSERT INTO Machines(Serial_Number, Model_Number) VALUES ("203", "MODEL303");
INSERT INTO Machines(Serial_Number, Model_Number) VALUES ("204", "MODEL404");
INSERT INTO Machines(Serial_Number, Model_Number) VALUES ("205", "MODEL505");
INSERT INTO Model(ID, Speed, RAM, HD, Price, Manufacturer_ID) VALUES ("MODEL101", 2.4, 280, 5, 500, 111);
INSERT INTO Model(ID, Speed, RAM, HD, Price, Manufacturer_ID) VALUES ("MODEL202", 0.5, 250, 10, 250, 222);
INSERT INTO Model(ID, Speed, RAM, HD, Price, Manufacturer_ID) VALUES ("MODEL303", 14.5, 522, 50, 50000, 333);
INSERT INTO Model(ID, Speed, RAM, HD, Price, Manufacturer_ID) VALUES ("MODEL404", 4.04, 280, 20, 325, 444);
INSERT INTO Model(ID, Speed, RAM, HD, Price, Manufacturer_ID) VALUES ("MODEL505", 5.6, 255, 30, 124, 555);
INSERT INTO Manufacturer(ID, Name, Phone_Number, Email_Address) VALUES (111, "Michael's", "537-254-7642", "yes@gmail.com"); 
INSERT INTO Manufacturer(ID, Name, Phone_Number, Email_Address) VALUES (222, "Lowe's", "532-754-1845", "2good@email.com");
INSERT INTO Manufacturer(ID, Name, Phone_Number, Email_Address) VALUES (333, "AlienWare", "124-643-0987", "winner69@gmail.com");
INSERT INTO Manufacturer(ID, Name, Phone_Number, Email_Address) VALUES (444, "Home Depot", "643-765-9765", "louissucks@idont.com");
INSERT INTO Manufacturer(ID, Name, Phone_Number, Email_Address) VALUES (555, "Krusty Krab", "908-800-2356", "starsshine@yahoo.com");



Part 1)

1)
select Name, count(Order_number) as NumOfOrders
from Customers join Orders on Customers.ID == Orders.Customer_ID
group by Customers.ID

2)
select Name, sum(Model.Price) as TotalSpent from Customers
join Orders on Customers.ID == Orders.Customer_ID
join Machines on Orders.Serial_Number == Machines.Serial_Number
join Model on Machines.Model_Number == Model.ID
group by Customers.ID

3)
select City, State, sum(Model.Price) as PurchaseTotal from Customers
join Orders on Customers.ID == Orders.Customer_ID
join Machines on orders.Serial_Number == Machines.Serial_Number
join Model on Machines.Model_Number == Model.ID
group by Customers.City, Customers.State

4)
select Model.ID, count(Orders.Order_Number) as ModelsOrdered from Model
left join Machines on Machines.Model_Number == Model.ID
left join Orders on Orders.Serial_Number == Machines.Serial_Number
group by Model.ID

5)
select distinct(Manufacturer.Name), Manufacturer.Phone_Number from Model
left join Machines on Machines.Model_Number == Model.ID
left join Orders on Orders.Serial_Number == Machines.Serial_Number
join Manufacturer on Manufacturer.ID == Model.Manufacturer_ID
group by Model.ID
having count(Orders.Order_number) < 3



Part 2)

1)
delete from Manufacturer where ID in (
select Manufacturer.ID
from Model
left join Machines on Machines.Model_Number == Model.ID
left join Orders on Orders.Serial_Number == Machines.Serial_Number
join Manufacturer on Manufacturer.ID == Model.Manufacturer_ID
group by Model.ID
having count(Orders.Order_Number) < 10)

2)
delete from Customers where ID in (
select ID
from Customers join Orders on Customers.ID == Orders.Customer_ID
group by Customers.ID
having count(Order_number) < 10)

3)
delete from Model where ID in (
select ID from Model
left join Machines on Machines.Model_Number == Model.ID
left join Orders on Orders.Serial_Number == Machines.Serial_Number
where Orders.Date_of_order < "2014-12-31"
group by Model.ID)
