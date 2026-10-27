USE mysql_learning;

SELECT COUNT(*) AS line_count, COUNT(DISTINCT o.order_id) AS order_count,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status IN ('paid', 'shipped');
SELECT COUNT(*) AS line_count, COUNT(DISTINCT o.order_id) AS order_count,
       SUM(oi.quantity * oi.unit_price) AS line_value
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id;
