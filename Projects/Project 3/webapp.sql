-- This file contains the MySQL code
-- Converted from Oracle SQL in Project 2
-- To be used with PHP as part of Project 3

-- Md Nabil Ahsan - E8
-- George Navarro - E7

-- Entering data into database
DROP TABLE Customer;
DROP TABLE Territory;
DROP TABLE SalesPerson;
DROP TABLE DoesBusinessIn;
DROP TABLE ProductLine;
DROP TABLE Product;
DROP TABLE Orderr;
DROP TABLE OrderLine;
DROP TABLE PriceUpdate  ;

-- Customers
CREATE TABLE Customer (
    c_id CHAR(30) NOT NULL,
    c_name CHAR(30),
    c_address CHAR(30),
    c_city CHAR(30),
    c_state CHAR(2),
    c_postalcode CHAR(30),
    c_email CHAR(30),
    c_username CHAR(30),
    c_password CHAR(30),
    PRIMARY KEY ( c_id ) );
    
INSERT INTO Customer VALUES ( 1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL', '32601-2871', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 2, 'Value Furnitures', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-7734', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 3, 'Home Furnishings', '1900 Allard Ave', 'Albany', 'NY', '12209-1125', 'homefurnishings?@gmail.com', 'CUSTOMER1', 'CUSTOMER1#' );
INSERT INTO Customer VALUES ( 4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 7, 'New Furniture', 'Palace Ave', 'Farmington', 'NM', '', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 8, 'Dunkins Furniture', '7700 Main St', 'Syracuse', 'NY', '31590', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 9, 'A Carpet', '434 Abe Dr', 'Rome', 'NY', '13440', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 12, 'Flanigan Furniture', 'Snow Flake Rd', 'Ft Walton Beach', 'FL', '32548', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 13, 'Ikards', '1011 S. Main St', 'Las Cruces', 'NM', '88001', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 14, 'Wild Bills', 'Four Horse Rd', 'Oak Brook', 'Il', '60522', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 15, 'Janet''s Collection', 'Janet Lane', 'Virginia Beach', 'VA', '10012', NULL, NULL, NULL);
INSERT INTO Customer VALUES ( 16, 'ABC Furniture Co.', '152 Geramino Drive', 'Rome', 'NY', '13440', NULL, NULL, NULL );

-- Territory
CREATE TABLE Territory (
    t_id CHAR(30),
    t_name CHAR(30),
    PRIMARY KEY ( t_id ) );
    
INSERT INTO Territory VALUES ( 1, 'SouthEast' );
INSERT INTO Territory VALUES ( 2, 'SouthWest' );
INSERT INTO Territory VALUES ( 3, 'NorthEast' );
INSERT INTO Territory VALUES ( 4, 'NorthWest' );
INSERT INTO Territory VALUES ( 5, 'Central' );

-- SalesPerson
CREATE TABLE SalesPerson (
    sp_id CHAR(30) NOT NULL,
    sp_name CHAR(30),
    sp_phone CHAR(30),
    sp_email CHAR(30),
    sp_username CHAR(30),
    sp_password CHAR(30),
    t_id CHAR(30),
    PRIMARY KEY ( t_id, sp_id ),
    FOREIGN KEY ( t_id ) REFERENCES Territory (t_id));

INSERT INTO SalesPerson VALUES ( 1, 'Doug Henny', '8134445555', 'salesperson?@gmail.com', 'SALESPERSON', 'SALESPERSON#', 1 );
INSERT INTO SalesPerson VALUES ( 2, 'Robert Lewis', '8139264006', '', '', '', 2 );
INSERT INTO SalesPerson VALUES ( 3, 'William Strong', '5053821212', '', '', '', 3 );
INSERT INTO SalesPerson VALUES ( 4, 'Julie Dawson', '4355346677', '', '', '', 4 );
INSERT INTO SalesPerson VALUES ( 5, 'Jacob Winslow', '2238973498', '', '', '', 5 );

-- DoesBusinessIn
CREATE TABLE DoesBusinessIn (
    c_id CHAR(30) NOT NULL,
    t_id CHAR(30) NOT NULL,
    PRIMARY KEY ( c_id, t_id ),
    FOREIGN KEY ( c_id ) REFERENCES Customer(c_id),
    FOREIGN KEY ( t_id ) REFERENCES Territory(t_id) );

INSERT INTO DoesBusinessIn VALUES ( 1, 1 );
INSERT INTO DoesBusinessIn VALUES ( 2, 2 );
INSERT INTO DoesBusinessIn VALUES ( 3, 3 );
INSERT INTO DoesBusinessIn VALUES ( 4, 4 );
INSERT INTO DoesBusinessIn VALUES ( 5, 5 );
INSERT INTO DoesBusinessIn VALUES ( 6, 1 );
INSERT INTO DoesBusinessIn VALUES ( 7, 2 );

-- ProductLine
CREATE TABLE ProductLine (
    pl_id CHAR(30) NOT NULL,
    pl_name CHAR(30),
    PRIMARY KEY ( pl_id ) );

INSERT INTO ProductLine VALUES ( 1, 'Cherry Tree' );
INSERT INTO ProductLine VALUES ( 2, 'Scandinavia' );
INSERT INTO ProductLine VALUES ( 3, 'Country Look' );

-- Product
CREATE TABLE Product (
    p_id CHAR(30) NOT NULL,
    p_name CHAR(30),
    p_finish CHAR(30),
    p_standard_price CHAR(30),
    pl_id CHAR(30),
    p_photo CHAR(30),
    PRIMARY KEY ( p_id ),
    FOREIGN KEY ( pl_id ) REFERENCES ProductLine(pl_id) );

INSERT INTO Product VALUES ( 1, 'End Table', 'Cherry', 175, 1, 'table.jpg' );
INSERT INTO Product VALUES ( 2, 'Coffee Table', 'Natural Ash', 200, 2, NULL );
INSERT INTO Product VALUES ( 3, 'Computer Desk', 'Natural Ash', 375, 2, NULL );
INSERT INTO Product VALUES ( 4, 'Entertainment Center', 'Natural Maple', 650, 3, NULL );
INSERT INTO Product VALUES ( 5, 'Writers Desk', 'Cherry', 325, 1, NULL );
INSERT INTO Product VALUES ( 6, '8-Drawer Desk', 'White Ash', 750, 2, NULL );
INSERT INTO Product VALUES ( 7, 'Dining Table', 'Natural Ash', 800, 2, NULL );
INSERT INTO Product VALUES ( 8, 'Computer Desk', 'Walnut', 250, 3, NULL );

-- Orderr
CREATE TABLE Orderr (
    o_id CHAR(30) NOT NULL,
    o_date DATE,
    c_id CHAR(30) NOT NULL, /* c_id is not a key, but has to reference a customer per Orderr */
    PRIMARY KEY ( o_id ),
    FOREIGN KEY ( c_id ) REFERENCES Customer(c_id) );

INSERT INTO Orderr VALUES ( 1001, '2016-8-21', 1 );
INSERT INTO Orderr VALUES ( 1002, '2016-7-21', 8 );
INSERT INTO Orderr VALUES ( 1003, '2016-8-22' , 15 );
INSERT INTO Orderr VALUES ( 1004, '2016-10-22', 5 );
INSERT INTO Orderr VALUES ( 1005, '2016-7-24', 3 );
INSERT INTO Orderr VALUES ( 1006, '2016-10-24', 2 );
INSERT INTO Orderr VALUES ( 1007, '2016-8-27', 5 );
INSERT INTO Orderr VALUES ( 1008, '2016-10-30', 12 );
INSERT INTO Orderr VALUES ( 1009, '2016-11-05', 4 );
INSERT INTO Orderr VALUES ( 1010, '2016-11-05', 1 );

-- OrderLine
CREATE TABLE OrderLine (
    o_id CHAR(30) NOT NULL,
    p_id CHAR(30) NOT NULL,
    quantity INTEGER,
    sale_price FLOAT,
    PRIMARY KEY ( o_id, p_id ),
    FOREIGN KEY ( o_id ) REFERENCES Orderr(o_id),
    FOREIGN KEY ( p_id ) REFERENCES Product(p_id) );

INSERT INTO OrderLine VALUES ( 1001, 1, 2, NULL );
INSERT INTO OrderLine VALUES ( 1001, 2, 2, NULL );
INSERT INTO OrderLine VALUES ( 1001, 4, 1, NULL );
INSERT INTO OrderLine VALUES ( 1002, 3, 5, NULL );
INSERT INTO OrderLine VALUES ( 1003, 3, 3, NULL );
INSERT INTO OrderLine VALUES ( 1004, 6, 2, NULL );
INSERT INTO OrderLine VALUES ( 1004, 8, 2, NULL );
INSERT INTO OrderLine VALUES ( 1005, 4, 4, NULL );
INSERT INTO OrderLine VALUES ( 1006, 4, 1, NULL );
INSERT INTO OrderLine VALUES ( 1006, 5, 2, NULL );
INSERT INTO OrderLine VALUES ( 1006, 7, 2, NULL );
INSERT INTO OrderLine VALUES ( 1007, 1, 3, NULL );
INSERT INTO OrderLine VALUES ( 1007, 2, 2, NULL );
INSERT INTO OrderLine VALUES ( 1008, 3, 3, NULL );
INSERT INTO OrderLine VALUES ( 1008, 8, 3, NULL );
INSERT INTO OrderLine VALUES ( 1009, 4, 2, NULL );
INSERT INTO OrderLine VALUES ( 1009, 7, 3, NULL );
INSERT INTO OrderLine VALUES ( 1010, 8, 10, NULL );

-- PriceUpdate
CREATE TABLE PriceUpdate (
    pu_id CHAR(30) NOT NULL,
    pu_date DATETIME,
    pu_old_price FLOAT,
    pu_new_price FLOAT,
    PRIMARY KEY ( pu_id ) );



-- All questions

-- Question 1
-- Listing all the products that cost less than $275

-- PRODUCTLESSTHAN275
-- 1                             
-- 2                             
-- 8                      

SELECT P.p_id AS ProductsLessThan275 FROM Product P
    WHERE P.p_standard_price < 275;       

-- Question 2
-- Listing the prices, names and product ID of all the products

-- PRODUCTUNITPRICE                 PRODUCTNAME                     PRODUCTID
-- 175                           	End Table                     	1                             
-- 200                           	Coffee Table                  	2                             
-- 375                           	Computer Desk                 	3                             
-- 650                           	Entertainment Center          	4                             
-- 325                           	Writers Desk                  	5                             
-- 750                           	8-Drawer Desk                 	6                             
-- 800                           	Dining Table                  	7                             
-- 250                           	Computer Desk                 	8                             

SELECT P.p_standard_price AS ProductUnitPrice, P.p_name AS ProductName, P.p_id AS ProductID
    FROM Product P;

-- Question 3
-- Calculating the average price for all our products

-- AVERAGEPRICE
-- 440.625

SELECT AVG(P.p_standard_price) AS AveragePrice
    FROM Product P;

-- Question 4
-- Returns the number of different items with order number 1004 

-- ITEMSORDER1004
-- 2
SELECT COUNT(*) AS ItemsOrdered1004 FROM OrderLine OL
    WHERE OL.o_id = '1004';

-- Question 5
-- Lists all the orders that have been completed since 10/24/2010

-- ORDERS
-- 1001                          
-- 1002                          
-- 1003                          
-- 1004                          
-- 1005                          
-- 1006                          
-- 1007                          
-- 1008                          
-- 1009                          
-- 1010                          

SELECT O.o_id AS Orders
    FROM Orderr O
        WHERE O.o_date >= STR_TO_DATE('10/24/2010', '%m/%d/%Y');

-- Question 6
-- List of all the furnitures that are NOT cherry

-- P_ID                              P_NAME                          P_FINISH                        P_STANDARD PRICE                PL_ID       P_PHOTO
-- 2                             	Coffee Table                  	Natural Ash                   	200                           	2                             	
-- 3                             	Computer Desk                 	Natural Ash                   	375                           	2                             	
-- 4                             	Entertainment Center          	Natural Maple                 	650                           	3                             	
-- 6                             	8-Drawer Desk                 	White Ash                     	750                           	2                             	
-- 7                             	Dining Table                  	Natural Ash                   	800                           	2                             	
-- 8                             	Computer Desk                 	Walnut                        	250                           	3                             	

SELECT *
    FROM Product P
        WHERE NOT P.p_finish = 'Cherry';

-- Question 7
-- Listing product name, finish, and standard price for all desks 
-- and all tables that cost more than $300 in the Product table. 

-- NAME                             FINISH                          PRICE
-- Computer Desk                 	Natural Ash                   	375                           
-- Entertainment Center          	Natural Maple                 	650                           
-- Writers Desk                  	Cherry                        	325                           
-- 8-Drawer Desk                 	White Ash                     	750                           
-- Dining Table                  	Natural Ash                   	800                           
SELECT P.p_name AS Name, P.p_finish AS Finish, P.p_standard_price AS Price
    FROM Product P
        WHERE P.p_standard_price >= '300';


-- Question 8
-- Listing all products in the Product table have a standard price between $ 200 and $ 300? 

-- NAME                             PRICE
-- Coffee Table                  	200                           
-- Computer Desk                 	250                           

SELECT P.p_name AS Name, P.p_standard_price AS Price
    FROM Product P
        WHERE P.p_standard_price BETWEEN '200' AND '300';

-- Question 9
-- Listing customer name, city, and state for all customers in the Customer table 
-- whose address is Florida, Texas, California, or Hawaii. 
-- List the customers alphabetically by state and alphabetically by customer within each state. 

-- NAME                             CITY                            STATE 
-- Impressions                   	Sacramento                    	CA
-- Contemporary Casuals          	Gainesville                   	FL
-- Flanigan Furniture            	Ft Walton Beach               	FL
-- Value Furnitures              	Plano                         	TX

SELECT C.c_name AS Name, C.c_city AS City, C.c_state AS State
    FROM Customer C
        WHERE C.c_state IN ('FL', 'TX', 'CA')
            ORDER BY C.c_state, C.c_name;

-- Question 10
-- Count the number of customers with addresses in each state to which we ship. 

--    STATE     CUSTOMER COUNT
--      NJ	        1
--      CA	        1
--      NM	        2
--      VA	        1
--      Il  	    1
--      NY	        4
--      CO	        1
--      FL	        2
--      TX	        1

SELECT C.c_state AS State, count(*) AS CustormerCount
    FROM Customer C
        GROUP BY C.c_state;

-- Question 11
-- Count the number of customers with addresses in each city to which we ship. List the cities by state. 

--  STATE   CITY                      CUSTOMERCOUNT
--    CA	Sacramento                    	1
--    CO	Boulder                       	1
--    FL	Ft Walton Beach               	1
--    FL	Gainesville                   	1
--    Il	Oak Brook                     	1
--    NJ	Carteret                      	1
--    NM	Farmington                    	1
--    NM	Las Cruces                    	1
--    NY	Albany                        	1
--    NY	Rome                          	2
--    NY	Syracuse                      	1
--    TX	Plano                         	1
--    VA	Virginia Beach                	1

SELECT C.c_state AS State, C.c_city AS City, COUNT(*) AS CustormerCount
    FROM Customer C
        GROUP BY C.c_city, C.c_state
        ORDER BY C.c_state;

-- Question 12
-- Find only states with more than one customer. 

--  STATESONEORMORE
--    NM
--    NY
--    FL
SELECT C.c_state AS StatesOneOrMore
    FROM Customer C
        GROUP BY C.c_state
        HAVING COUNT(C.c_id) > 1;

-- Question 13
-- List, in alphabetical order, the product finish and the average standard price for
-- each finish for selected finishes having an average standard price less than 750. 

--    FINISH                          AVERAGEPRICE
--    Cherry                        	250
--    Natural Ash                   	287.5
--    Natural Maple                 	650
--    Walnut                        	250

SELECT P.p_finish AS Finish, AVG(P.p_standard_price) AS AveragePrice
    FROM Product P
        WHERE P.p_standard_price < '750'
        GROUP BY P.p_finish
        ORDER BY P.p_finish;

-- Question 14
-- Total value of orders placed for each furniture product.

--      NAME                            FINISH                      PRODUCTSUM
--    End Table                     	Cherry                        	5
--    Computer Desk                 	Natural Ash                   	11
--    8-Drawer Desk                 	White Ash                     	2
--    Dining Table                  	Natural Ash                   	5
--    Computer Desk                 	Walnut                        	15
--    Writers Desk                  	Cherry                        	2
--    Entertainment Center          	Natural Maple                 	8
--    Coffee Table                  	Natural Ash                   	4

SELECT P.p_name AS Name, P.p_finish AS Finish, SUM(OL.quantity) AS ProductSum
    FROM OrderLine OL, Product P
        WHERE OL.p_id = P.p_id
        GROUP BY OL.p_id, P.p_name, P.p_finish;        
