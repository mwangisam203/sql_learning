USE mysql_learning;

SELECT customer_id, full_name, city
FROM customers
ORDER BY customer_id;

SELECT product_name, price, stock, price * stock AS inventory_value
FROM products
ORDER BY product_id;

-- FROM is unnecessary for a constant expression.
SELECT 2 + 3 AS result, 'Hello, MySQL' AS greeting;
