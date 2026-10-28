USE mysql_learning;

CREATE TEMPORARY TABLE workshop23_rows (id INT PRIMARY KEY) ENGINE=InnoDB;
INSERT INTO workshop23_rows (id) VALUES (1),(2);
START TRANSACTION;
DELETE FROM workshop23_rows WHERE id = 1;
ROLLBACK;
SELECT COUNT(*) AS after_delete_rollback FROM workshop23_rows;
START TRANSACTION;
TRUNCATE TABLE workshop23_rows;
ROLLBACK;
SELECT COUNT(*) AS after_truncate_rollback FROM workshop23_rows;
DROP TEMPORARY TABLE workshop23_rows;
