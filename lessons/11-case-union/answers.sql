USE mysql_learning;

SELECT product_name, CASE WHEN stock < 30 THEN 'reorder' ELSE 'ok' END AS stock_label
FROM products ORDER BY product_id;
SELECT customer_id, 'email' AS contact_type, email AS contact_value FROM customers
UNION ALL
SELECT customer_id, 'city' AS contact_type, city AS contact_value FROM customers
ORDER BY customer_id, contact_type;
