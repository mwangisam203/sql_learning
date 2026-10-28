USE mysql_learning;

WITH movements AS (
    SELECT 1 AS movement_id, 5 AS delta UNION ALL SELECT 2,-3 UNION ALL SELECT 3,1
)
SELECT movement_id,delta,10 + SUM(delta) OVER (
    ORDER BY movement_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_stock FROM movements ORDER BY movement_id;
WITH movements AS (
    SELECT 1 AS movement_id, 5 AS delta UNION ALL SELECT 2,-3 UNION ALL SELECT 3,1
)
SELECT 10 + SUM(delta) AS expected_stock, 12 AS cached_stock,
       10 + SUM(delta) - 12 AS discrepancy FROM movements;
