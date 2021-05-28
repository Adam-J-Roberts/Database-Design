CREATE TABLE Product(
	Maker TEXT,
	Model Int,
	Type TEXT,
    PRIMARY KEY (Maker, Model)
);
CREATE TABLE PC(
	Model Int PRIMARY KEY,
	Speed REAL,
    RAM Int,
    HD Int,
    Price Real	
);
CREATE TABLE Laptop(
    Model Int PRIMARY KEY,
	Speed REAL,
    RAM Int,
    HD Int,
    Screen Int,
    Price Real
);
CREATE TABLE Printer(
    Model Int PRIMARY KEY,
    Color bit,
    Type TEXT,
    Price Real
);


INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Microsoft",1342 ,"PC"),("Microsoft",1312 ,"PC"),("Microsoft",1355,"PC"),("Microsoft", 1347,"PC");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("ASUS",2333,"PC"),("ASUS",2354 ,"PC"),("ASUS",2387 ,"PC"),("ASUS",2393 ,"PC");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Dell",3312,"PC"),("Dell",3343 ,"PC"),("Dell",3398 ,"PC"),("Dell", 3366,"PC");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Altavista",4388 ,"PC"),("Altavista",4355,"PC"),("Altavista",4322 ,"PC"),("Altavista",4356,"PC");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Chami", 5344,"PC"),("Chami",5387,"PC"),("Chami", 5325,"PC"),("Chami",5309,"PC");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Borland", 6352,"PC"),("Borland",6399,"PC"),("Borland",6390 ,"PC"),("Borland",6391 ,"PC");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Apple", 7355,"PC"),("Apple",7321,"PC"),("Apple",7344,"PC"),("Apple",7377,"PC");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Microsoft",1442 ,"Laptop"),("Microsoft",1412 ,"Laptop"),("Microsoft",1455,"Laptop"),("Microsoft", 1447,"Laptop");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("ASUS",2444,"Laptop"),("ASUS",2454 ,"Laptop"),("ASUS",2487 ,"Laptop"),("ASUS",2493 ,"Laptop");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Dell",3412,"Laptop"),("Dell",3444 ,"Laptop"),("Dell",3498 ,"Laptop"),("Dell", 3466,"Laptop");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Altavista",4488 ,"Laptop"),("Altavista",4455,"Laptop"),("Altavista",4422 ,"Laptop"),("Altavista",4456,"Laptop");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Chami", 5444,"Laptop"),("Chami",5487,"Laptop"),("Chami", 5425,"Laptop"),("Chami",5409,"Laptop");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Borland", 6452,"Laptop"),("Borland",6499,"Laptop"),("Borland",6490 ,"Laptop"),("Borland",6491 ,"Laptop");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Apple", 7455,"Laptop"),("Apple",7421,"Laptop"),("Apple",7444,"Laptop"),("Apple",7477,"Laptop");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Jenkins",7412,"Laptop"),("Dell",7454 ,"Laptop"),("Dell",7498 ,"Laptop"),("Dell", 7466,"Laptop");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Microsoft",1552 ,"Printer"),("Microsoft",1512 ,"Printer"),("Microsoft",1555,"Printer"),("Microsoft", 1557,"Printer");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("ASUS",2554,"Printer"),("ASUS",2555 ,"Printer"),("ASUS",2587 ,"Printer"),("ASUS",2593 ,"Printer");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Dell",3512,"Printer"),("Dell",3554 ,"Printer"),("Dell",3598 ,"Printer"),("Dell", 3566,"Printer");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Altavista",4588 ,"Printer"),("Altavista",4555,"Printer"),("Altavista",4522 ,"Printer"),("Altavista",4556,"Printer");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Chami", 5545,"Printer"),("Chami",5587,"Printer"),("Chami", 5525,"Printer"),("Chami",5509,"Printer");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Borland", 6552,"Printer"),("Borland",6599,"Printer"),("Borland",6590 ,"Printer"),("Borland",6591 ,"Printer");
INSERT INTO `Product` (`Maker`,`Model`,`Type`) VALUES ("Apple", 7555,"Printer"),("Apple",7521,"Printer"),("Apple",7554,"Printer"),("Apple",7577,"Printer");


INSERT INTO `PC` (`Model`,`Speed`,`RAM`,'HD','Price') VALUES (1342 ,1.7, 8, 64, 499),(1312, 1.8, 16, 128, 599),(1355, 1.9, 32, 256, 699),(1347, 2.0, 64, 500, 799);
INSERT INTO `PC` (`Model`,`Speed`,`RAM`,'HD','Price') VALUES (2333, 1.7, 8, 64, 499),(2354, 1.8, 16, 128, 599),(2387, 1.9, 32, 256, 699),(2393, 2.0, 64, 500, 799);
INSERT INTO `PC` (`Model`,`Speed`,`RAM`,'HD','Price') VALUES (3312, 1.7, 8, 64, 499),(3343, 1.8, 16, 128, 599),(3398, 1.9, 32, 256, 699),(3366, 2.0, 64, 500, 799);
INSERT INTO `PC` (`Model`,`Speed`,`RAM`,'HD','Price') VALUES (4388, 1.7, 8, 64, 499),(4355, 1.8, 16, 128, 599),(4322, 1.9, 32, 256, 699),(4356, 2.0, 64, 500, 799);
INSERT INTO `PC` (`Model`,`Speed`,`RAM`,'HD','Price') VALUES (5344, 1.7, 8, 64, 499),(5387, 1.8, 16, 128, 599),(5325, 1.9, 32, 256, 699),(5309, 2.0, 64, 500, 799);
INSERT INTO `PC` (`Model`,`Speed`,`RAM`,'HD','Price') VALUES (6352, 1.7, 8, 64, 499),(6399, 1.8, 16, 128, 599),(6390, 1.9, 32, 256, 699),(6391, 2.0, 64, 500, 799);
INSERT INTO `PC` (`Model`,`Speed`,`RAM`,'HD','Price') VALUES (7355, 1.7, 8, 64, 499),(7321, 1.8, 16, 128, 599),(7344, 1.9, 32, 256, 699),(7377, 2.0, 64, 500, 799);

INSERT INTO `Laptop` (`Model`,`Speed`,`RAM`,'HD','Screen','Price') VALUES (1442, 1.7, 8, 64, 15, 799),(1412, 1.8, 16, 128, 15, 899),(1455, 1.9, 32, 256, 16, 999),(1447, 2.0, 64, 500, 17, 1099);                                  
INSERT INTO `Laptop` (`Model`,`Speed`,`RAM`,'HD','Screen','Price') VALUES (2444, 1.7, 8, 64, 15, 799),(2454, 1.8, 16, 128, 15, 899),(2487, 1.9, 32, 256, 16, 999),(2493, 2.0, 64, 500, 17, 1099);
INSERT INTO `Laptop` (`Model`,`Speed`,`RAM`,'HD','Screen','Price') VALUES (3412, 1.7, 8, 64, 15, 799),(3444, 1.8, 16, 128, 15, 899),(3498, 1.9, 32, 256, 16, 999),(3466, 2.0, 64, 500, 17, 1099);
INSERT INTO `Laptop` (`Model`,`Speed`,`RAM`,'HD','Screen','Price') VALUES (4488, 1.7, 8, 64, 15, 799),(4455, 1.8, 16, 128, 15, 899),(4422, 1.9, 32, 256, 16, 999),(4456, 2.0, 64, 500, 17, 1099);
INSERT INTO `Laptop` (`Model`,`Speed`,`RAM`,'HD','Screen','Price') VALUES (5444, 1.7, 8, 64, 15, 799),(5487, 1.8, 16, 128, 15, 899),(5425, 1.9, 32, 256, 16, 999),(5409, 2.0, 64, 500, 17, 1099);
INSERT INTO `Laptop` (`Model`,`Speed`,`RAM`,'HD','Screen','Price') VALUES (6452, 1.7, 8, 64, 15, 799),(6499, 1.8, 16, 128, 15, 899),(6490, 1.9, 32, 256, 16, 999),(6491, 2.0, 64, 500, 17, 1099);
INSERT INTO `Laptop` (`Model`,`Speed`,`RAM`,'HD','Screen','Price') VALUES (7455, 1.7, 8, 64, 15, 799),(7421, 1.8, 16, 128, 15, 899),(7444, 1.9, 32, 256, 16, 999),(7477, 2.0, 64, 500, 17, 1099);
INSERT INTO `Laptop` (`Model`,`Speed`,`RAM`,'HD','Screen','Price') VALUES (7412, 1.7, 8, 64, 15, 799),(7454, 1.8, 16, 128, 15, 899),(7498, 1.9, 32, 256, 16, 999),(7466, 2.0, 64, 500, 17, 1099);                                  


INSERT INTO `Printer` (`Model`,`Color`,`Type`,'Price') VALUES (1552, "B&W", "Laser", 799),(1512, "B&W", "Ink", 499),(1555, "Color", "Laser", 899),(1557, "Color", "Ink", 599);
INSERT INTO `Printer` (`Model`,`Color`,`Type`,'Price') VALUES (2554, "B&W", "Laser", 799),(2555, "B&W", "Ink", 499),(2587, "Color", "Laser", 899),(2593, "Color", "Ink", 599);
INSERT INTO `Printer` (`Model`,`Color`,`Type`,'Price') VALUES (3512, "B&W", "Laser", 799),(3554, "B&W", "Ink", 499),(3598, "Color", "Laser", 899),(3566, "Color", "Ink", 599);
INSERT INTO `Printer` (`Model`,`Color`,`Type`,'Price') VALUES (4588, "B&W", "Laser", 799),(4555, "B&W", "Ink", 499),(4522, "Color", "Laser", 899),(4556, "Color", "Ink", 599);
INSERT INTO `Printer` (`Model`,`Color`,`Type`,'Price') VALUES (5545, "B&W", "Laser", 799),(5587, "B&W", "Ink", 499),(5525, "Color", "Laser", 899),(5509, "Color", "Ink", 599);
INSERT INTO `Printer` (`Model`,`Color`,`Type`,'Price') VALUES (6552, "B&W", "Laser", 799),(6599, "B&W", "Ink", 499),(6590, "Color", "Laser", 899),(6591, "Color", "Ink", 599);
INSERT INTO `Printer` (`Model`,`Color`,`Type`,'Price') VALUES (7555, "B&W", "Laser", 799),(7521, "B&W", "Ink", 499),(7554, "Color", "Laser", 899),(7577, "Color", "Ink", 599);

--a) What PC models have a speed of at least 3.00?

select Maker, Product.Model, Speed from Product
join PC on Product.Model == PC.Model
where Speed > 3.00

--b) Which manufacturers make laptops with a hard disk of at least 100GB?
select distinct(Maker) from Product
join Laptop on Product.Model == Laptop.Model
where HD > 100

--c) Find the model number and price of all products (of any type) made by
--manufacturer B.
select Product.Model, Price from Product 
join Laptop on Product.Model = Laptop.Model 
where Maker = "Apple"
UNION
select Product.Model, Price from Product 
join PC on Product.Model = PC.Model 
where Maker = "Apple"
UNION
select Product.Model, Price from Product 
join printer on Product.Model = Printer.Model 
where Maker = "Apple"

--d) Find the model numbers of all color laser printers.
select Model from Printer
where (Color == "Color") AND (Type == "Laser")


--e) Find those manufacturers that sell Laptops, but not P C ’sselect Maker from Product
select Maker from Product
join laptop on Product.Model==Laptop.Model
except
select Maker from Product join PC on Product.Model == PC.Model

/*

a) R (A, B, C, D) with FD’s A B —► C, C -> D, and D -> A
ABC            ABD
              AD   AB


b) R (A ,B ,C ,D ) with FD’s B —> C and B -> D
BC  BAD
    BD   BA

c) R{A, B , C, D) with FD’s AB -> C , BC -> D, CD -> A, and AD->B
All ready BCNF

d) R(A, B , C, D) with FD’s A ->B, B->C, C->D D->A
All ready BCNF
*/