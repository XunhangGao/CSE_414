/*1.*/
CREATE TABLE Sales(
 name VARCHAR(10),
 discount DECIMAL(5,2),
 month VARCHAR(3),
 price INT
);

.mode csv
.import mrFrumbleData.csv Sales

/*2.*/

--name -> discount
SELECT DISTINCT S1.name, S1.discount, S2.discount
FROM Sales AS S1
JOIN Sales AS S2
ON S1.name = S2.name
WHERE S1.discount != S2.discount
LIMIT 1;

--name -> month
SELECT DISTINCT S1.name, S1.month, S2.month
FROM Sales AS S1
JOIN Sales AS S2
ON S1.name = S2.name
WHERE S1.month != S2.month
LIMIT 1;

--name -> price
SELECT DISTINCT S1.name, S1.price, S2.price
FROM Sales AS S1
JOIN Sales AS S2
ON S1.name = S2.name
WHERE S1.price != S2.price
LIMIT 1;

--discount -> name
SELECT DISTINCT S1.discount, S1.name, S2.name
FROM Sales AS S1
JOIN Sales AS S2
ON S1.discount = S2.discount
WHERE S1.name != S2.name
LIMIT 1;

--discount -> month
SELECT DISTINCT S1.discount, S1.month, S2.month
FROM Sales AS S1
JOIN Sales AS S2
ON S1.discount = S2.discount
WHERE S1.month != S2.month
LIMIT 1;

--discount -> price
SELECT DISTINCT S1.discount, S1.price, S2.price
FROM Sales AS S1
JOIN Sales AS S2
ON S1.discount = S2.discount
WHERE S1.price != S2.price
LIMIT 1;

--month -> name
SELECT DISTINCT S1.month, S1.name, S2.name
FROM Sales AS S1
JOIN Sales AS S2
ON S1.month = S2.month
WHERE S1.name != S2.name
LIMIT 1;

--month -> discount
SELECT DISTINCT S1.month, S1.discount, S2.discount
FROM Sales AS S1
JOIN Sales AS S2
ON S1.month = S2.month
WHERE S1.discount != S2.discount
LIMIT 1;

--month -> price
SELECT DISTINCT S1.month, S1.price, S2.price
FROM Sales AS S1
JOIN Sales AS S2
ON S1.month = S2.month
WHERE S1.price != S2.price
LIMIT 1;

--price -> name
SELECT DISTINCT S1.price, S1.name, S2.name
FROM Sales AS S1
JOIN Sales AS S2
ON S1.price = S2.price
WHERE S1.name != S2.name
LIMIT 1;

--price -> discount
SELECT DISTINCT S1.price, S1.discount, S2.discount
FROM Sales AS S1
JOIN Sales AS S2
ON S1.price = S2.price
WHERE S1.discount != S2.discount
LIMIT 1;

--price -> month
SELECT DISTINCT S1.price, S1.month, S2.month
FROM Sales AS S1
JOIN Sales AS S2
ON S1.price = S2.price
WHERE S1.month != S2.month
LIMIT 1;

--name,discount -> month
SELECT DISTINCT S1.name, S1.discount, S1.month, S2.month
FROM Sales AS S1
JOIN Sales AS S2
ON S1.name = S2.name
AND S1.discount = S2.discount
WHERE S1.month != S2.month
LIMIT 1;

--name,price -> discount
SELECT DISTINCT S1.name, S1.price, S1.discount, S2.discount
FROM Sales AS S1
JOIN Sales AS S2
ON S1.name = S2.name
AND S1.price = S2.price
WHERE S1.discount != S2.discount
LIMIT 1;

--name,price -> month
SELECT DISTINCT S1.name, S1.price, S1.month, S2.month
FROM Sales AS S1
JOIN Sales AS S2
ON S1.name = S2.name
AND S1.price = S2.price
WHERE S1.month != S2.month
LIMIT 1;

--discount,month -> name
SELECT DISTINCT S1.discount, S1.month, S1.name, S2.name
FROM Sales AS S1
JOIN Sales AS S2
ON S1.discount = S2.discount
AND S1.month = S2.month
WHERE S1.name != S2.name
LIMIT 1;

--discount,month -> price
SELECT DISTINCT S1.discount, S1.month, S1.price, S2.price
FROM Sales AS S1
JOIN Sales AS S2
ON S1.discount = S2.discount
AND S1.month = S2.month
WHERE S1.price != S2.price
LIMIT 1;

--discount,price -> name
SELECT DISTINCT S1.discount, S1.price, S1.name, S2.name
FROM Sales AS S1
JOIN Sales AS S2
ON S1.discount = S2.discount
AND S1.price = S2.price
WHERE S1.name != S2.name
LIMIT 1;

--discount,price -> month
SELECT DISTINCT S1.discount, S1.price, S1.month, S2.month
FROM Sales AS S1
JOIN Sales AS S2
ON S1.discount = S2.discount
AND S1.price = S2.price
WHERE S1.month != S2.month
LIMIT 1;

--month,price -> name
SELECT DISTINCT S1.month, S1.price, S1.name, S2.name
FROM Sales AS S1
JOIN Sales AS S2
ON S1.month = S2.month
AND S1.price = S2.price
WHERE S1.name != S2.name
LIMIT 1;

--name,discount,price -> month
SELECT DISTINCT S1.name, S1.discount, S1.price, S1.month, S2.month
FROM Sales As S1
JOIN Sales AS S2
ON S1.name = S2.name
AND S1.discount = S2.discount
AND S1.price = S2.price
WHERE S1.month != S2.month
LIMIT 1;

--name,discount,price -> month
SELECT DISTINCT S1.discount, S1.month, S1.price, S1.name, S2.name
FROM Sales As S1
JOIN Sales AS S2
ON S1.discount = S2.discount
AND S1.month = S2.month
AND S1.price = S2.price
WHERE S1.name != S2.name
LIMIT 1;

/*The "name -> price" and "month -> discount" are the only two FDs
in this dataset as they do not have any output.

3.
R = (name, discount, month, price)
Start with "name -> price"
R1 = name+ = (name, price), R2 = (name, month, discount)
Then, for R2, there is "month -> discount"
Then, R3 = (month, discount), R4 = (month, name)
Thus, there is no more ways to decompose,
And R can be decomposed into BCNF as:
R1 = (name, price), R3 = (month,discount), R4 = (month, name) */

CREATE TABLE R1(
    name VARCHAR(10) PRIMARY KEY,
    price INT
);

CREATE TABLE R3(
    month VARCHAR(3) PRIMARY KEY,
    discount DECIMAL(5,2)
);

CREATE TABLE R4(
    month VARCHAR(3),
    name VARCHAR(10),
    FOREIGN KEY(month) REFERENCES R3(month),
    FOREIGN KEY(name) REFERENCES R1(name)
);


/*4.*/
INSERT INTO R1
SELECT DISTINCT S.name, S.price
FROM Sales AS S;

INSERT INTO R3
SELECT DISTINCT S.month, S.discount
FROM Sales AS S;

INSERT INTO R4
SELECT DISTINCT S.name, S.month
FROM Sales AS S;

SELECT COUNT(*)
FROM R1;
-- results in 36

SELECT COUNT(*)
FROM R3;
-- results in 12

SELECT COUNT(*)
FROM R4;
-- result in 426
