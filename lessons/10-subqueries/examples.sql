USE mysql_learning;

SELECT product_id, product_name, price FROM products
WHERE price > (SELECT AVG(price) FROM products) ORDER BY product_id;

SELECT c.customer_id, c.full_name FROM customers AS c
WHERE EXISTS (SELECT 1 FROM orders AS o
              WHERE o.customer_id = c.customer_id AND o.status IN ('paid', 'shipped'))
ORDER BY c.customer_id;

SELECT customer_id, full_name FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE status = 'pending')
ORDER BY customer_id;
