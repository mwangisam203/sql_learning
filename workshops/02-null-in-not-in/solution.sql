USE mysql_learning;

WITH candidates AS (SELECT 1 AS id UNION ALL SELECT 2 UNION ALL SELECT 3),
excluded AS (SELECT 1 AS id UNION ALL SELECT NULL)
SELECT COUNT(*) AS not_in_matches FROM candidates WHERE id NOT IN (SELECT id FROM excluded);
WITH candidates AS (SELECT 1 AS id UNION ALL SELECT 2 UNION ALL SELECT 3),
excluded AS (SELECT 1 AS id UNION ALL SELECT NULL)
SELECT c.id FROM candidates AS c
WHERE NOT EXISTS (SELECT 1 FROM excluded AS e WHERE e.id = c.id) ORDER BY c.id;
