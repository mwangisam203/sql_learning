USE mysql_learning;

SELECT product_id, product_name, price * stock AS inventory_value
FROM products ORDER BY product_id;
SELECT DISTINCT city FROM customers ORDER BY city;
