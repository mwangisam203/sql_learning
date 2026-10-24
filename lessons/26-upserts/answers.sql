USE mysql_learning;

CREATE TEMPORARY TABLE lesson26_stock (
    product_id INT PRIMARY KEY, stock INT NOT NULL CHECK (stock >= 0)
) ENGINE=InnoDB;
INSERT INTO lesson26_stock (product_id, stock) VALUES (1, 10);
INSERT INTO lesson26_stock (product_id, stock) VALUES (1, 12)
ON DUPLICATE KEY UPDATE stock = 12;
INSERT INTO lesson26_stock (product_id, stock) VALUES (1, 12)
ON DUPLICATE KEY UPDATE stock = 12;
INSERT INTO lesson26_stock (product_id, stock) VALUES (5, 6)
ON DUPLICATE KEY UPDATE stock = 6;
SELECT product_id, stock FROM lesson26_stock ORDER BY product_id;
DROP TEMPORARY TABLE lesson26_stock;
