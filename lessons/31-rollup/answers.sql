USE mysql_learning;

SELECT CASE WHEN GROUPING(category) = 1 THEN 'ALL' ELSE category END AS category_label,
       COUNT(*) AS product_count, SUM(stock) AS stock_units, GROUPING(category) AS is_total
FROM products GROUP BY category WITH ROLLUP
ORDER BY GROUPING(category), category;
