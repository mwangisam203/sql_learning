USE mysql_learning;

SELECT customer_id, full_name FROM customers
WHERE city = 'Nairobi' ORDER BY customer_id;

SELECT product_id, product_name, price FROM products
WHERE price BETWEEN 5.00 AND 30.00 ORDER BY product_id;

SELECT order_id, status FROM orders
WHERE ordered_at >= '2025-02-01' AND ordered_at < '2025-03-01'
ORDER BY order_id;

SELECT order_id FROM orders
WHERE status IN ('paid', 'shipped') AND (customer_id = 1 OR customer_id = 2)
ORDER BY order_id;
