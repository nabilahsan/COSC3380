--> Aggregate Functions
-- SUM(FieldName): Gives the value of all the values in a field
-- MAX(FieldName): Gives the highest value in a field
-- MIN(FieldName): Gives the lowest value in a field
-- AVG(FieldName): Gives the average for all values in a field
-- COUNT(*): Gives the total number of tuples in a table

SELECT SUM(FieldName1), FROM TableName; -- OR..
SELECT SUM(FieldName1) AS SumOfField1, FROM TableName;

SELECT SUM(FieldName1), MAX(population), FROM TableName; -- OR..
SELECT SUM(FieldName1) AS SumOfField1, MAX(population) AS MaxOfField2, FROM TableName;

--> GROUP BY
-- FieldName1, <aggregateFunction> FROM TableName GROUP BY FieldName1;
    -- Get the aggregate value based on each FieldName1 values
-- FieldName1, FieldName2, <aggregateFunction> FROM TableName GROUP BY FieldName1, FieldName2;
    -- Get the aggregate value based on each FieldName1, FieldName2 values
SELECT FieldName1, SUM(FieldName2), FROM TableName
    GROUP BY FieldName1;
SELECT FieldName1, FieldName2, SUM(FieldName3), FROM TableName
    GROUP BY FieldName1;
--> HAVING
-- HAVING <condition>
-- <condition> can use aggregate functions
SELECT FieldName1, SUM(FieldName2), FROM TableName
    GROUP BY FieldName1
    HAVING SUM(FieldName2) > 1;