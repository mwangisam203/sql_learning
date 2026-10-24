USE mysql_learning;

-- A flattened export repeats customer attributes for each order line.
SELECT o.order_id, c.customer_id, c.full_name, p.product_name, oi.quantity
FROM orders AS o JOIN customers AS c ON c.customer_id = o.customer_id
JOIN order_items AS oi ON oi.order_id = o.order_id
JOIN products AS p ON p.product_id = oi.product_id
WHERE o.customer_id = 1 ORDER BY o.order_id, oi.product_id;

-- The underlying customer record exists once.
SELECT customer_id, full_name, email FROM customers WHERE customer_id = 1;
