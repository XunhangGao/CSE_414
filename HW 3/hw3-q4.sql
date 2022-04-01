-- results in 256 rows
-- 10 seconds
SELECT DISTINCT F2.dest_city AS city
FROM FLIGHTS AS F1
JOIN FLIGHTS AS F2
ON F1.dest_city = F2.origin_city
WHERE F1.origin_city = 'Seattle WA'
AND F2.dest_city != 'Seattle WA'
AND F2.dest_city NOT IN (SELECT T1.dest_city
                         FROM FLIGHTS AS T1
						 WHERE T1.origin_city = 'Seattle WA')
ORDER BY F2.dest_city;

-- first 20 rows of results
-- city
-- Aberdeen SD
-- Abilene TX
-- Adak Island AK
-- Aguadilla PR
-- Akron OH
-- Albany GA
-- Albany NY
-- Alexandria LA
-- Allentown/Bethlehem/Easton PA
-- Alpena MI
-- Amarillo TX
-- Appleton WI
-- Arcata/Eureka CA
-- Asheville NC
-- Ashland WV
-- Aspen CO
-- Atlantic City NJ
-- Augusta GA
-- Bakersfield CA
-- Bangor ME