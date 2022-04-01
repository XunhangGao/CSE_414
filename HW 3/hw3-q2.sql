-- results in 109 rows
-- 9 seconds
SELECT DISTINCT F1.origin_city AS city
FROM FLIGHTS AS F1
JOIN (SELECT origin_city, max(actual_time) AS max_flight_time
      FROM FLIGHTS AS F2
      GROUP BY F2.origin_city) AS ORIGINS
ON F1.origin_city = ORIGINS.origin_city
WHERE F1.actual_time = ORIGINS.max_flight_time
AND ORIGINS.max_flight_time < 180
AND F1.canceled = 0;

SELECT DISTINCT F1.origin_city AS city
FROM FLIGHTS AS F1
WHERE F1.canceled = 0
GROUP BY F1.origin_city
HAVING MAX(F1.actual_time) < 180
ORDER BY F1.origin_city;


-- first 20 rows of results
-- city
-- Aberdeen SD
-- Abilene TX
-- Alpena MI
-- Ashland WV
-- Augusta GA
-- Barrow AK
-- Beaumont/Port Arthur TX
-- Bemidji MN
-- Bethel AK
-- Binghamton NY
-- Brainerd MN
-- Bristol/Johnson City/Kingsport TN
-- Butte MT
-- Carlsbad CA
-- Casper WY
-- Cedar City UT
-- Chico CA
-- College Station/Bryan TX
-- Columbia MO
-- Columbus GA