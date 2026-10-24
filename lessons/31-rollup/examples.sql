USE mysql_learning;

SELECT CASE WHEN GROUPING(status) = 1 THEN 'ALL' ELSE status END AS status_label,
       COUNT(*) AS order_count, GROUPING(status) AS is_total
FROM orders GROUP BY status WITH ROLLUP
ORDER BY GROUPING(status), status;
