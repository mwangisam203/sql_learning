USE mysql_learning;

WITH line_entries AS (
    SELECT 1 AS order_id, CAST(10 AS DECIMAL(10,2)) AS amount UNION ALL SELECT 1,20
), payments AS (
    SELECT 1 AS order_id, CAST(5 AS DECIMAL(10,2)) AS amount
    UNION ALL SELECT 1,10 UNION ALL SELECT 1,15
)
SELECT COUNT(*) AS joined_rows, SUM(l.amount) AS summed_lines, SUM(p.amount) AS summed_payments
FROM line_entries AS l JOIN payments AS p ON p.order_id = l.order_id;
WITH line_entries AS (
    SELECT 1 AS order_id, CAST(10 AS DECIMAL(10,2)) AS amount UNION ALL SELECT 1,20
), payments AS (
    SELECT 1 AS order_id, CAST(5 AS DECIMAL(10,2)) AS amount
    UNION ALL SELECT 1,10 UNION ALL SELECT 1,15
), line_totals AS (SELECT order_id, SUM(amount) AS total FROM line_entries GROUP BY order_id),
payment_totals AS (SELECT order_id, SUM(amount) AS total FROM payments GROUP BY order_id)
SELECT l.order_id, l.total AS line_total, p.total AS payment_total
FROM line_totals AS l JOIN payment_totals AS p ON p.order_id = l.order_id ORDER BY l.order_id;
