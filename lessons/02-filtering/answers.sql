USE mysql_learning;

SELECT product_name, price FROM products
WHERE category = 'electronics' AND price >= 8.00 ORDER BY product_id;
SELECT full_name FROM customers WHERE full_name LIKE 'A%' ORDER BY customer_id;
