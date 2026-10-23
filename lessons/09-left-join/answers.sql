USE mysql_learning;

SELECT p.product_id, p.product_name FROM products AS p
LEFT JOIN order_items AS oi ON oi.product_id = p.product_id
WHERE oi.order_id IS NULL ORDER BY p.product_id;
SELECT c.customer_id, c.full_name FROM customers AS c
LEFT JOIN orders AS o ON o.customer_id = c.customer_id AND o.status IN ('paid', 'shipped')
WHERE o.order_id IS NULL ORDER BY c.customer_id;
