USE mysql_learning;

WITH completed_order_totals AS (
    SELECT o.order_id, o.ordered_at, SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY o.order_id, o.ordered_at
)
SELECT DATE_FORMAT(ordered_at, '%Y-%m') AS month, SUM(order_total) AS revenue
FROM completed_order_totals GROUP BY DATE_FORMAT(ordered_at, '%Y-%m') ORDER BY month;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM numbers WHERE n < 5
)
SELECT n FROM numbers ORDER BY n;
