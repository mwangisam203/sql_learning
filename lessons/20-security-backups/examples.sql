USE mysql_learning;
SET @email_input = 'amina@example.test';
PREPARE customer_lookup FROM
  'SELECT customer_id, full_name FROM customers WHERE email = ?';
EXECUTE customer_lookup USING @email_input;
DEALLOCATE PREPARE customer_lookup;
SHOW GRANTS FOR CURRENT_USER;

-- Administrator illustration only. Replace the example before executing.
-- CREATE USER 'learning_reader'@'localhost' IDENTIFIED BY 'REPLACE_WITH_A_UNIQUE_PASSWORD';
-- GRANT SELECT ON mysql_learning.* TO 'learning_reader'@'localhost';
-- SHOW GRANTS FOR 'learning_reader'@'localhost';
-- REVOKE SELECT ON mysql_learning.* FROM 'learning_reader'@'localhost';
-- DROP USER 'learning_reader'@'localhost';
