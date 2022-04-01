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
