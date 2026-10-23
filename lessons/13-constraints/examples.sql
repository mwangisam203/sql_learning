USE mysql_learning;

SHOW CREATE TABLE customers;
SHOW CREATE TABLE order_items;
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'mysql_learning' AND TABLE_NAME = 'order_items'
ORDER BY CONSTRAINT_NAME;

-- Intentional failures: commented so the complete example file succeeds.
-- START TRANSACTION;
-- INSERT INTO customers (full_name, email, city, joined_on)
-- VALUES ('Duplicate', 'amina@example.test', 'Nairobi', '2025-03-01');
-- ROLLBACK;
-- START TRANSACTION;
-- UPDATE products SET stock = -1 WHERE product_id = 1;
-- ROLLBACK;
-- START TRANSACTION;
-- INSERT INTO orders (customer_id, ordered_at) VALUES (999999, '2025-03-10');
-- ROLLBACK;
