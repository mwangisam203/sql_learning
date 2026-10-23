USE mysql_learning;

SELECT product_id, product_name, price FROM products
ORDER BY price DESC, product_id ASC LIMIT 3;

SELECT customer_id, full_name FROM customers
ORDER BY customer_id LIMIT 2 OFFSET 0;
SELECT customer_id, full_name FROM customers
ORDER BY customer_id LIMIT 2 OFFSET 2;

-- Continue a customer feed after the last seen ID, 2.
SELECT customer_id, full_name FROM customers
WHERE customer_id > 2 ORDER BY customer_id LIMIT 2;
