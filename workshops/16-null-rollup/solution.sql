USE mysql_learning;

WITH sales AS (
    SELECT CAST(NULL AS CHAR(10)) AS category, 2 AS amount
    UNION ALL SELECT 'home',3 UNION ALL SELECT 'home',4
)
SELECT CASE WHEN GROUPING(category) = 1 THEN 'ALL'
            ELSE COALESCE(category,'(missing)') END AS category_label,
       SUM(amount) AS total, GROUPING(category) AS is_total
FROM sales GROUP BY category WITH ROLLUP ORDER BY GROUPING(category),category;
