USE mysql_learning;

CREATE TEMPORARY TABLE lesson24_quote_lines (
    line_id INT PRIMARY KEY, quantity INT NOT NULL, unit_price DECIMAL(10,2) NOT NULL,
    line_total DECIMAL(12,2) GENERATED ALWAYS AS (quantity * unit_price) STORED
) ENGINE=InnoDB;
INSERT INTO lesson24_quote_lines (line_id, quantity, unit_price) VALUES (1, 3, 4.50);
SELECT line_id, line_total FROM lesson24_quote_lines ORDER BY line_id;
UPDATE lesson24_quote_lines SET quantity = 4 WHERE line_id = 1;
SELECT line_id, line_total FROM lesson24_quote_lines ORDER BY line_id;
DROP TEMPORARY TABLE lesson24_quote_lines;
