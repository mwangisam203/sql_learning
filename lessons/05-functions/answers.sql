USE mysql_learning;

SELECT LOWER(product_name) AS lower_name, CHAR_LENGTH(product_name) AS characters
FROM products ORDER BY product_id;
SELECT full_name, DATE_ADD(joined_on, INTERVAL 7 DAY) AS follow_up_on
FROM customers ORDER BY customer_id;
