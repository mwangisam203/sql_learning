USE mysql_learning;

CREATE TEMPORARY TABLE lesson24_quote_lines (
    line_id INT PRIMARY KEY,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    line_total DECIMAL(12,2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    INDEX idx_line_total (line_total)
) ENGINE=InnoDB;
INSERT INTO lesson24_quote_lines (line_id, quantity, unit_price)
VALUES (1, 2, 4.50), (2, 3, 8.00);
SELECT line_id, quantity, unit_price, line_total FROM lesson24_quote_lines ORDER BY line_id;
UPDATE lesson24_quote_lines SET quantity = 4 WHERE line_id = 1;
SELECT line_id, line_total FROM lesson24_quote_lines WHERE line_id = 1;
DROP TEMPORARY TABLE lesson24_quote_lines;
