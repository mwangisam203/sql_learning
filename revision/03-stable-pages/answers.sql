USE mysql_learning;

SELECT product_id, price FROM products ORDER BY price DESC, product_id ASC LIMIT 3;
SELECT product_id, price FROM products
WHERE price < 12.00 OR (price = 12.00 AND product_id > 3)
ORDER BY price DESC, product_id ASC LIMIT 3;
