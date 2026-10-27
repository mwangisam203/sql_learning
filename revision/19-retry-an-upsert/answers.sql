USE mysql_learning;

CREATE TEMPORARY TABLE revision19_stock (
    product_id INT PRIMARY KEY, stock INT NOT NULL CHECK (stock >= 0)
) ENGINE=InnoDB;
INSERT INTO revision19_stock (product_id, stock) VALUES (1, 10);
INSERT INTO revision19_stock (product_id, stock) VALUES (1, 12)
ON DUPLICATE KEY UPDATE stock = 12;
INSERT INTO revision19_stock (product_id, stock) VALUES (1, 12)
ON DUPLICATE KEY UPDATE stock = 12;
SELECT product_id, stock FROM revision19_stock ORDER BY product_id;
INSERT INTO revision19_stock (product_id, stock) VALUES (1, 2)
ON DUPLICATE KEY UPDATE stock = stock + 2;
INSERT INTO revision19_stock (product_id, stock) VALUES (1, 2)
ON DUPLICATE KEY UPDATE stock = stock + 2;
SELECT product_id, stock FROM revision19_stock ORDER BY product_id;
DROP TEMPORARY TABLE revision19_stock;
