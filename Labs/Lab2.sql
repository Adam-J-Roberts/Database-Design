FD's
Order Number => everything
Cust ID => Name
Address => Name, Cust ID
Ser# => everything
Model => Specs
Specs => Model


Cust ID => Name || CID, O#, Date, Ser#, Model, Specs, Address
                   Model=>Specs || Model, O#, Date, ser#, Address

3 tables

CREATE TABLE CustID ( 
	CustID INT PRIMARY KEY,
    Name Text,
);

CREATE TABLE Model ( 
	Model# INT PRIMARY KEY,
    Speed REAL,
	RAM	INT,
	HD Int,
	Price Int
);

CREATE TABLE Orders (
    CustID INT,
	Model INT,
    OrderID INT PRIMARY KEY,
	Date TEXT,
	Ser# Int,
	Address Text
);

Jen Haber, Hunter Cool, Adam Robert
