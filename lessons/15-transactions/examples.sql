USE mysql_learning;

SELECT @@autocommit AS autocommit_mode, @@transaction_isolation AS isolation_level;
START TRANSACTION;
SELECT product_id, stock FROM products WHERE product_id = 1 FOR UPDATE;
UPDATE products SET stock = stock - 1 WHERE product_id = 1 AND stock >= 1;
SELECT ROW_COUNT() AS reserved_rows;
SAVEPOINT after_first_reservation;
UPDATE products SET stock = stock - 1 WHERE product_id = 3 AND stock >= 1;
ROLLBACK TO SAVEPOINT after_first_reservation;
SELECT product_id, stock FROM products WHERE product_id IN (1, 3) ORDER BY product_id;
ROLLBACK;
SELECT product_id, stock FROM products WHERE product_id IN (1, 3) ORDER BY product_id;

-- A read-only transaction demonstrates COMMIT without changing seed rows.
START TRANSACTION READ ONLY;
SELECT COUNT(*) AS product_count FROM products;
COMMIT;
