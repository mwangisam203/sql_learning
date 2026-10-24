USE mysql_learning;

DELIMITER //
CREATE PROCEDURE lesson33_category_products(IN p_category VARCHAR(40))
SQL SECURITY INVOKER
READS SQL DATA
BEGIN
    SELECT product_id, product_name, price FROM products
    WHERE category = p_category ORDER BY product_id;
END//
DELIMITER ;
CALL lesson33_category_products('stationery');
DROP PROCEDURE lesson33_category_products;
