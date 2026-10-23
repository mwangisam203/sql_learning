USE mysql_learning;

SELECT order_id, ordered_at FROM orders
ORDER BY ordered_at DESC, order_id DESC LIMIT 2;
SELECT customer_id, full_name FROM customers
WHERE customer_id > 4 ORDER BY customer_id LIMIT 2;
