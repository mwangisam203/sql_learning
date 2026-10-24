USE mysql_learning;

CREATE TABLE lesson34_inventory (product_id INT PRIMARY KEY, stock INT NOT NULL) ENGINE=InnoDB;
CREATE TABLE lesson34_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL, old_stock INT NOT NULL, new_stock INT NOT NULL
) ENGINE=InnoDB;
INSERT INTO lesson34_inventory (product_id, stock) VALUES (1, 10);
DELIMITER //
CREATE TRIGGER lesson34_stock_audit AFTER UPDATE ON lesson34_inventory
FOR EACH ROW
BEGIN
    IF NOT (OLD.stock <=> NEW.stock) THEN
        INSERT INTO lesson34_audit (product_id, old_stock, new_stock)
        VALUES (NEW.product_id, OLD.stock, NEW.stock);
    END IF;
END//
DELIMITER ;
START TRANSACTION;
UPDATE lesson34_inventory SET stock = 7 WHERE product_id = 1;
UPDATE lesson34_inventory SET stock = 7 WHERE product_id = 1;
SELECT product_id, old_stock, new_stock FROM lesson34_audit ORDER BY audit_id;
SELECT COUNT(*) AS audit_rows FROM lesson34_audit;
ROLLBACK;
SELECT stock FROM lesson34_inventory WHERE product_id = 1;
SELECT COUNT(*) AS audit_rows_after_rollback FROM lesson34_audit;
DROP TABLE lesson34_inventory;
DROP TABLE lesson34_audit;
