-- results in 4 rows
-- 7 seconds
SELECT DISTINCT C.name AS carrier
FROM FLIGHTS AS F
JOIN CARRIERS AS C
ON C.cid = F.carrier_id
WHERE F.origin_city = 'Seattle WA'
AND F.dest_city = 'San Francisco CA'
ORDER BY C.name;


-- first 20 rows of results
-- carrier
-- Alaska Airlines Inc.
-- SkyWest Airlines Inc.
-- United Air Lines Inc.
-- Virgin America