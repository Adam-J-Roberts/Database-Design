Adam Roberts
2/13/20
Database HW1

CREATE TABLE Classes (
	class	TEXT,
	type	TEXT,
	county	TEXT,
	numGuns	INT,
	bore	INT,
	displacement	INT,
	PRIMARY KEY (class, type) 
);
//I assume a class has various types, 
and that each country only makes certain types.
CREATE TABLE Ships (
	name	TEXT,
	class	TEXT,
	launched TEXT,
	PRIMARY KEY (name)
);

CREATE TABLE Battles (
	name	TEXT,
	date	TEXT,
	PRIMARY KEY (name, date)
);

CREATE TABLE Outcomes (
	ship	TEXT,
	battle	TEXT,
	result	TEXT,
	PRIMARY KEY (ship, battle)
);

ALTER TABLE Classes DROP bore;
ALTER TABLE Classes ADD yard TEXT;
---------------------------------------
2.4.3 (a-c)

SELECT class, country FROM Classes WHERE bore >= 16;
SELECT name FROM Ships WHERE launched < '1921.01.01';
SELECT ship FROM Outcomes WHERE battle = 'Denmark Strait' AND result = 'sunk'; 
 



