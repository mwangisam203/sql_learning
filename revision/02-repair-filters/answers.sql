USE mysql_learning;

SELECT product_id, product_name FROM products
WHERE (category = 'electronics' AND price >= 8.00)
   OR (category = 'home' AND price <= 12.00)
ORDER BY product_id;
SELECT order_id, customer_id FROM orders
WHERE status IN ('paid', 'shipped')
  AND ordered_at >= '2025-02-01' AND ordered_at < '2025-03-01'
ORDER BY order_id;
