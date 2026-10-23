USE mysql_learning;

START TRANSACTION;
INSERT INTO customers (full_name, email, city, phone, joined_on)
VALUES ('Practice Customer', 'practice@example.test', 'Nakuru', NULL, '2025-03-10');
SET @practice_customer_id = LAST_INSERT_ID();
SELECT customer_id, full_name FROM customers WHERE customer_id = @practice_customer_id;
SELECT customer_id, city FROM customers WHERE customer_id = @practice_customer_id;
UPDATE customers SET city = 'Nairobi' WHERE customer_id = @practice_customer_id;
SELECT ROW_COUNT() AS changed_rows;
DELETE FROM customers WHERE customer_id = @practice_customer_id;
SELECT ROW_COUNT() AS deleted_rows;
ROLLBACK;

START TRANSACTION;
SELECT product_id, stock FROM products WHERE product_id = 1;
UPDATE products SET stock = stock - 1 WHERE product_id = 1 AND stock >= 1;
SELECT ROW_COUNT() AS changed_rows;
SELECT product_id, stock FROM products WHERE product_id = 1;
ROLLBACK;
SELECT product_id, stock FROM products WHERE product_id = 1;
