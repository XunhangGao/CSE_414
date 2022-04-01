-- results in 3 rows
-- 294 seconds
SELECT F.dest_city AS city
FROM (SELECT F1.dest_city
      FROM FLIGHTS AS F1) AS F
WHERE F.dest_city NOT IN (SELECT F2.dest_city
                          FROM FLIGHTS AS F2
                          WHERE F2.origin_city = 'Seattle WA')
AND F.dest_city NOT IN (SELECT F4.dest_city
                        FROM FLIGHTS AS F3
                        JOIN FLIGHTS AS F4
                        ON F3.dest_city = F4.origin_city
                        WHERE F3.origin_city = 'Seattle WA'
                        AND F4.dest_city != 'Seattle WA')
AND F.dest_city != 'Seattle WA'
GROUP BY F.dest_city
ORDER BY F.dest_city;


-- first 20 rows of results
-- city
-- Devils Lake ND
-- Hattiesburg/Laurel MS
-- St. Augustine FL