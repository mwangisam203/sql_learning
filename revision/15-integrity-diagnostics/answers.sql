USE mysql_learning;

SELECT CONSTRAINT_TYPE, COUNT(*) AS constraints_count
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'mysql_learning' AND TABLE_NAME = 'products'
GROUP BY CONSTRAINT_TYPE ORDER BY CONSTRAINT_TYPE;
SELECT (SELECT COUNT(*) FROM orders AS o WHERE NOT EXISTS
          (SELECT 1 FROM customers AS c WHERE c.customer_id = o.customer_id)) AS orphan_orders,
       (SELECT COUNT(*) FROM products WHERE stock < 0 OR price < 0) AS invalid_products,
       (SELECT COUNT(*) FROM order_items WHERE quantity <= 0 OR unit_price < 0) AS invalid_lines;
