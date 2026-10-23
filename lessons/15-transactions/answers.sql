USE mysql_learning;

START TRANSACTION;
UPDATE products SET stock = stock - 2 WHERE product_id = 5 AND stock >= 2;
SELECT ROW_COUNT() AS reserved_rows;
SELECT stock FROM products WHERE product_id = 5;
ROLLBACK;
SELECT stock FROM products WHERE product_id = 5;
-- Expected: 1 changed row, then stock 58, then stock 60.
-- ALTER TABLE would implicitly commit the earlier UPDATE; ROLLBACK cannot undo it.
