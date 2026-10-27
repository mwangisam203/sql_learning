USE mysql_learning;

START TRANSACTION;
UPDATE products SET stock = stock - 2 WHERE product_id = 5 AND stock >= 2;
SELECT ROW_COUNT() AS reserved_rows;
SELECT stock FROM products WHERE product_id = 5;
ROLLBACK;
SELECT stock FROM products WHERE product_id = 5;
START TRANSACTION;
UPDATE products SET stock = stock - 999 WHERE product_id = 5 AND stock >= 999;
SELECT ROW_COUNT() AS reserved_rows;
ROLLBACK;
SELECT stock FROM products WHERE product_id = 5;
