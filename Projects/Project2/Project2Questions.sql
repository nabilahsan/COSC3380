-- Question 1
SELECT P.p_id AS ProductsLessThan275 FROM Product P
    WHERE P.p_standard_price >= 275;

-- Question 2
SELECT P.p_standard_price AS ProductUnitPrice, P.p_name AS ProductName, P.p_id AS ProductID
    FROM Product P;

-- Question 3
SELECT AVG(P.p_standard_price) AS AveragePrice
    FROM Product P;

-- Question 4
SELECT COUNT(*) AS ItemsOrdered1004 FROM OrderLine OL
    WHERE OL.o_id = '1004';

-- Question 5
SELECT O.o_id AS Orders
    FROM Orderr O
        WHERE O.o_date >= TO_DATE('10/24/2010', 'MM/DD/YYYY');

-- Question 6
SELECT *
    FROM Product P
        WHERE NOT P.p_finish = 'Cherry';

-- Question 7
SELECT P.p_name AS Name, P.p_finish AS Finish, P.p_standard_price AS Price
    FROM Product P
        WHERE P.p_standard_price >= '300';


-- Question 8
SELECT P.p_name AS Name, P.p_standard_price AS Price
    FROM Product P
        WHERE P.p_standard_price BETWEEN '200' AND '300';

-- Question 9
SELECT C.c_name AS Name, C.c_city AS City, C.c_state AS State
    FROM Customer C
        WHERE C.c_state IN ('FL', 'TX', 'CA')
            ORDER BY C.c_state, C.c_name;

-- Question 10
SELECT C.c_state AS State, COUNT (*) AS CustormerCount
    FROM Customer C
        GROUP BY C.c_state;

-- Question 11
SELECT C.c_state AS State, C.c_city AS City, COUNT(*) AS CustormerCount
    FROM Customer C
        GROUP BY C.c_city, C.c_state
        ORDER BY C.c_state;

-- Question 12
SELECT C.c_state AS StatesOneOrMore
    FROM Customer C
        GROUP BY C.c_state
        HAVING COUNT(C.c_id) > 1;

-- Question 13
SELECT P.p_finish AS Finish, AVG(P.p_standard_price) AS AveragePrice
    FROM Product P
        WHERE P.p_standard_price < '750'
        GROUP BY P.p_finish
        ORDER BY P.p_finish;

-- Question 14
SELECT P.p_name AS Name, P.p_finish AS Finish, SUM(OL.quantity) AS ProductSum
    FROM OrderLine OL, Product P
        WHERE OL.p_id = P.p_id
        GROUP BY OL.p_id, P.p_name, P.p_finish;
