USE mysql_learning;

SELECT p.product_id, p.product_name, p.category FROM products AS p
WHERE p.price > (SELECT AVG(other.price) FROM products AS other WHERE other.category = p.category)
ORDER BY p.product_id;
SELECT product_id, price FROM products
WHERE price > (SELECT AVG(price) FROM products) ORDER BY product_id;
