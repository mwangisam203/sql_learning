USE mysql_learning;

SELECT p.product_id, p.product_name FROM products AS p
WHERE NOT EXISTS (SELECT 1 FROM order_items AS oi WHERE oi.product_id = p.product_id)
ORDER BY p.product_id;
SELECT c.customer_id, c.full_name FROM customers AS c
WHERE NOT EXISTS (SELECT 1 FROM orders AS o WHERE o.customer_id = c.customer_id)
ORDER BY c.customer_id;
