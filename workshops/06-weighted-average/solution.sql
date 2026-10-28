USE mysql_learning;

WITH purchases AS (
    SELECT 1 AS purchase_id, CAST(10 AS DECIMAL(10,2)) AS unit_price, 1 AS quantity
    UNION ALL SELECT 2,20,9
)
SELECT SUM(quantity) AS total_units,
       CAST(AVG(unit_price) AS DECIMAL(10,2)) AS unweighted_price,
       CAST(SUM(unit_price * quantity) / NULLIF(SUM(quantity),0) AS DECIMAL(10,2)) AS weighted_price
FROM purchases;
