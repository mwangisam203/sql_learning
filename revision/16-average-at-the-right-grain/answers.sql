USE mysql_learning;

WITH completed_totals AS (
    SELECT o.order_id, SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY o.order_id
)
SELECT COUNT(*) AS completed_orders, SUM(order_total) AS revenue,
       CAST(AVG(order_total) AS DECIMAL(10,2)) AS average_order_value FROM completed_totals;
SELECT COUNT(*) AS line_count, SUM(oi.quantity) AS units,
       CAST(AVG(oi.quantity * oi.unit_price) AS DECIMAL(10,2)) AS average_line_value
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status IN ('paid', 'shipped');
