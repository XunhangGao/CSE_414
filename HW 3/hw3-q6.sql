-- results in 4 rows
-- 1 second
SELECT DISTINCT C.name AS carrier
FROM CARRIERS AS C
JOIN (SELECT f.carrier_id
      FROM FLIGHTS AS F
      WHERE F.origin_city = 'Seattle WA'
      AND F.dest_city = 'San Francisco CA') AS F1
ON C.cid = F1.carrier_id
ORDER BY C.name;


-- first 20 rows of results
-- carrier
-- Alaska Airlines Inc.
-- SkyWest Airlines Inc.
-- United Air Lines Inc.
-- Virgin America