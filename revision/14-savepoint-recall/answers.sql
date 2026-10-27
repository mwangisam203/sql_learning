USE mysql_learning;

START TRANSACTION;
UPDATE products SET stock = stock - 2 WHERE product_id = 1 AND stock >= 2;
SAVEPOINT after_notebook;
UPDATE products SET stock = stock - 1 WHERE product_id = 3 AND stock >= 1;
ROLLBACK TO SAVEPOINT after_notebook;
SELECT product_id, stock FROM products WHERE product_id IN (1, 3) ORDER BY product_id;
ROLLBACK;
SELECT product_id, stock FROM products WHERE product_id IN (1, 3) ORDER BY product_id;
START TRANSACTION;
INSERT INTO customers (full_name, email, city, joined_on)
VALUES ('Revision Learner', 'revision-learner@example.test', 'Nairobi', '2025-03-10');
SET @revision_customer_id = LAST_INSERT_ID();
SELECT COUNT(*) AS practice_rows FROM customers WHERE customer_id = @revision_customer_id;
ROLLBACK;
SELECT COUNT(*) AS practice_rows FROM customers WHERE customer_id = @revision_customer_id;
