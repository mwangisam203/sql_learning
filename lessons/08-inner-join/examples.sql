USE mysql_learning;

SELECT o.order_id, c.full_name, o.status FROM orders AS o
JOIN customers AS c ON c.customer_id = o.customer_id ORDER BY o.order_id;

SELECT o.order_id, p.product_name, oi.quantity, oi.unit_price,
       oi.quantity * oi.unit_price AS line_total
FROM orders AS o
JOIN order_items AS oi ON oi.order_id = o.order_id
JOIN products AS p ON p.product_id = oi.product_id
WHERE o.status IN ('paid', 'shipped') ORDER BY o.order_id, p.product_id;

SELECT o.order_id, SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
GROUP BY o.order_id ORDER BY o.order_id;
