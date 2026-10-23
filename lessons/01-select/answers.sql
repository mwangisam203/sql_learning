USE mysql_learning;

SELECT product_name, price FROM products ORDER BY product_id;
SELECT product_name, ROUND(price * 1.10, 2) AS proposed_price
FROM products ORDER BY product_id;
