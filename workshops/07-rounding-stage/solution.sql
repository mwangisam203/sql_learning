USE mysql_learning;

WITH line_entries AS (
    SELECT 1 AS line_id, CAST(0.335 AS DECIMAL(10,3)) AS amount
    UNION ALL SELECT 2,CAST(0.335 AS DECIMAL(10,3))
)
SELECT line_id, amount, ROUND(amount,2) AS rounded_amount FROM line_entries ORDER BY line_id;
WITH line_entries AS (
    SELECT 1 AS line_id, CAST(0.335 AS DECIMAL(10,3)) AS amount
    UNION ALL SELECT 2,CAST(0.335 AS DECIMAL(10,3))
)
SELECT SUM(ROUND(amount,2)) AS summed_rounded_lines, ROUND(SUM(amount),2) AS rounded_sum FROM line_entries;
