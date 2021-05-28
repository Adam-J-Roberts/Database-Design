CREATE TABLE Orders (
	OrderNumber Int,
	OrderDate Date,
	CustomerName Text,
	CustomerStreet Text,
	CustomerCity Text,
	CustomerState Text,
	CustomerZip Int,
	CustomerCountry	TEXT,
	ModelNumber	Int,
	Speed REAL,
	RAM	INT,
	HD Int,
	Price Int
);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES ( 36,	"2015-11-03",	"Kasandra Cryer",	"884 Meadow Lane",	"Bardstown",	"KY",	40004,	"US",	1004,	2.8,	1024,	250,	649);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (172,	"2014-10-02",	"Ferne Linebarger",	"172 Academy Street",	"Morton Grove",	"IL",	60053,	"US",	1005,	3.2,	512,	250,	630);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (236,	"2016-02-06",	"Britany Manges",	"144 Fawn Court",	"Antioch",	"TN",	37013,	"US",	1008,	2.2,	2048,	250,	770);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (245,	"2015-02-11",	"Alma Secrist",	"877 Cherry Street",	"Augusta",	"GA",	30906,	"US",	1010,	2.8,	2048,	300,	770);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (272,	"2015-04-16",	"Sanda Archer",	"948 Penn Street",	"New Rochelle",	"NY",	10801,	"US",	1012,	2.8,	1024,	160,	649);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (278,	"2009-06-07",	"Michal Verona",	"225 Surrey Lane",	"Windermere",	"FL",	34786,	"US",	1009,	2,	1024,	250,	650);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (321,	"2014-05-16",	"Yuki Maio",	"163 Route 2",	"Warminster",	"PA",	18974,	"US",	1007,	2.2,	1024,	200,	510);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (345,	"2008-04-12",	"Alma Secrist",	"877 Cherry Street",	"Augusta",	"GA",	30906,	"US",	1006,	3.2,	1024,	320,	1049);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (431,	"2015-09-29",	"Nichole Chiles",	"997 Columbia Street",	"Avon",	"IN",	46123,	"US",	1002,	2.1,	512,	250,	995);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (435,	"2012-04-23",	"Nichole Chiles",	"997 Columbia Street",	"Avon",	"IN",	46123,	"US",	1005,	3.2,	512,	250,	630);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (504,	"2012-04-19",	"Kasandra Cryer",	"884 Meadow Lane",	"Bardstown",	"KY",	40004,	"US",	1007,	2.2,	1024,	200,	510);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (562,	"2013-12-17",	"Margy Avis",	"888 Virginia Street",	"Kokomo",	"IN",	46901,	"US",	1009,	2,	1024,	250,	650);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (583,	"2015-11-21",	"Britany Manges",	"144 Fawn Court",	"Antioch",	"TN",	37013,	"US",	1004,	2.8,	1024,	250,	649);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (643,	"2003-10-04",	"Elana Shahid",	"206 High Street",	"Bolingbrook",	"IL",	60440,	"US",	1010,	2.8,	2048,	300,	770);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (712,	"2012-02-15",	"Kasandra Cryer",	"884 Meadow Lane",	"Bardstown",	"KY",	40004,	"US",	1004,	2.8,	1024,	250,	649);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (737,	"2010-01-04",	"Michal Verona",	"225 Surrey Lane",	"Windermere",	"FL",	34786,	"US",	1011,	2.86,	2048,	160,	959);

INSERT INTO Orders(OrderNumber, OrderDate, CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry, ModelNumber, Speed, RAM, HD, Price) VALUES (863,	"2010-08-06",	"Marvella Searcy",	"782 Edgewood Road",	"Smyrna",	"GA",	30080,	"US",	1003,	1.42,	512,	80,	478);


SELECT HD FROM Orders WHERE OrderDate < '2011-01-01';

SELECT ModelNumber FROM Orders WHERE CustomerState == 'IN';

SELECT CustomerName, CustomerStreet, CustomerCity, CustomerState, CustomerZip, CustomerCountry FROM Orders WHERE Price > 850 AND OrderDate > '2012-12-31';

SELECT ModelNumber FROM Orders WHERE Speed > 2.8 AND Price < 600;