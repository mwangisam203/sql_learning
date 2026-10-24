USE mysql_learning;

SELECT o.order_id, oi.product_id, c.full_name, oi.quantity
FROM orders AS o JOIN customers AS c ON c.customer_id = o.customer_id
JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE c.customer_id = 1 ORDER BY o.order_id, oi.product_id;
SELECT customer_id, full_name FROM customers WHERE customer_id = 1;
