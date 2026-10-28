USE mysql_learning;

WITH left_rows AS (SELECT 1 AS id UNION ALL SELECT 1 UNION ALL SELECT 2),
right_rows AS (SELECT 2 AS id UNION ALL SELECT 3)
SELECT COUNT(*) AS row_count, SUM(id) AS id_total FROM (
    SELECT id FROM left_rows UNION SELECT id FROM right_rows
) AS combined;
WITH left_rows AS (SELECT 1 AS id UNION ALL SELECT 1 UNION ALL SELECT 2),
right_rows AS (SELECT 2 AS id UNION ALL SELECT 3)
SELECT COUNT(*) AS row_count, SUM(id) AS id_total FROM (
    SELECT id FROM left_rows UNION ALL SELECT id FROM right_rows
) AS combined;
