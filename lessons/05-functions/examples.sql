USE mysql_learning;

SELECT full_name, UPPER(full_name) AS uppercase_name,
       CONCAT(full_name, ' <', email, '>') AS contact
FROM customers ORDER BY customer_id;
SELECT product_name, ROUND(price * 1.16, 2) AS price_with_sample_tax
FROM products ORDER BY product_id;
SELECT order_id, DATE_FORMAT(ordered_at, '%Y-%m') AS order_month
FROM orders ORDER BY order_id;
SELECT DATEDIFF('2025-03-08', '2025-03-01') AS days_apart;
