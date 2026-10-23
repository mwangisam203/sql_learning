USE mysql_learning;

SELECT SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status IN ('paid', 'shipped');
SELECT COUNT(DISTINCT o.order_id) AS completed_orders
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status IN ('paid', 'shipped');
