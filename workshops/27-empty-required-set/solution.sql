USE mysql_learning;

WITH candidates AS (SELECT 1 AS id UNION ALL SELECT 2),
required AS (SELECT 10 AS product_id WHERE FALSE),
purchases AS (SELECT 1 AS candidate_id,10 AS product_id UNION ALL SELECT 2,20)
SELECT c.id FROM candidates AS c WHERE NOT EXISTS (
    SELECT 1 FROM required AS r WHERE NOT EXISTS (
        SELECT 1 FROM purchases AS p WHERE p.candidate_id = c.id AND p.product_id = r.product_id
    )
) ORDER BY c.id;
WITH candidates AS (SELECT 1 AS id UNION ALL SELECT 2),
required AS (SELECT 10 AS product_id WHERE FALSE),
purchases AS (SELECT 1 AS candidate_id,10 AS product_id UNION ALL SELECT 2,20)
SELECT COUNT(*) AS explicit_nonempty_matches FROM candidates AS c
WHERE EXISTS (SELECT 1 FROM required) AND NOT EXISTS (
    SELECT 1 FROM required AS r WHERE NOT EXISTS (
        SELECT 1 FROM purchases AS p WHERE p.candidate_id = c.id AND p.product_id = r.product_id
    )
);
