USE mysql_learning;

START TRANSACTION;
SELECT product_id, price FROM products WHERE product_id = 3;
UPDATE products SET price = 13.00 WHERE product_id = 3;
SELECT product_id, price FROM products WHERE product_id = 3;
ROLLBACK;

START TRANSACTION;
INSERT INTO products (product_name, category, price, stock)
VALUES ('Practice Sticker', 'stationery', 0.50, 10);
SET @new_product_id = LAST_INSERT_ID();
DELETE FROM products WHERE product_id = @new_product_id;
SELECT ROW_COUNT() AS deleted_rows;
ROLLBACK;
