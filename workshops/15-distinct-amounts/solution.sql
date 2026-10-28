USE mysql_learning;

WITH line_entries AS (
    SELECT 1 AS line_id, CAST(10 AS DECIMAL(10,2)) AS amount UNION ALL SELECT 2,10
)
SELECT COUNT(*) AS lines_count, SUM(amount) AS correct_total,
       SUM(DISTINCT amount) AS distinct_value_total FROM line_entries;
