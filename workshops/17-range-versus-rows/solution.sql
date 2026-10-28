USE mysql_learning;

WITH entries AS (
    SELECT 1 AS row_id, 10 AS score, 1 AS amount
    UNION ALL SELECT 2,10,2 UNION ALL SELECT 3,20,3
)
SELECT row_id,
       SUM(amount) OVER (ORDER BY score RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS range_total,
       SUM(amount) OVER (ORDER BY score,row_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS rows_total
FROM entries ORDER BY row_id;
