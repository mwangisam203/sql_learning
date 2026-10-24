USE mysql_learning;

CREATE TEMPORARY TABLE lesson35_incoming (
    batch_row INT PRIMARY KEY, external_id VARCHAR(20) NOT NULL,
    customer_id INT NULL, quantity INT NULL, price DECIMAL(10,2) NULL, status VARCHAR(20) NULL
) ENGINE=InnoDB;
INSERT INTO lesson35_incoming (batch_row, external_id, customer_id, quantity, price, status)
VALUES (1,'event-a',1,2,4.50,'paid'), (2,'event-a',2,1,8.00,'paid'),
       (3,'event-b',999999,1,5.00,'pending'), (4,'event-c',3,0,4.50,'paid'),
       (5,'event-d',4,1,-1.00,'cancelled'), (6,'event-e',5,1,8.00,'unknown'),
       (7,'event-f',6,1,2.00,'pending');
CREATE TEMPORARY TABLE lesson35_issues (batch_row INT NOT NULL, issue VARCHAR(40) NOT NULL) ENGINE=InnoDB;
INSERT INTO lesson35_issues (batch_row, issue)
SELECT batch_row, 'duplicate_external_id' FROM (
    SELECT batch_row, COUNT(*) OVER (PARTITION BY external_id) AS copies FROM lesson35_incoming
) AS counted WHERE copies > 1;
INSERT INTO lesson35_issues (batch_row, issue)
SELECT s.batch_row, 'missing_customer' FROM lesson35_incoming AS s
WHERE NOT EXISTS (SELECT 1 FROM customers AS c WHERE c.customer_id = s.customer_id);
INSERT INTO lesson35_issues (batch_row, issue)
SELECT batch_row, 'invalid_quantity' FROM lesson35_incoming WHERE quantity IS NULL OR quantity <= 0;
INSERT INTO lesson35_issues (batch_row, issue)
SELECT batch_row, 'invalid_price' FROM lesson35_incoming WHERE price IS NULL OR price < 0;
INSERT INTO lesson35_issues (batch_row, issue)
SELECT batch_row, 'invalid_status' FROM lesson35_incoming
WHERE status IS NULL OR status NOT IN ('pending', 'paid', 'shipped', 'cancelled');
SELECT i.batch_row, s.external_id, i.issue FROM lesson35_issues AS i
JOIN lesson35_incoming AS s ON s.batch_row = i.batch_row ORDER BY i.batch_row, i.issue;
SELECT totals.input_rows, totals.rejected_rows,
       totals.input_rows - totals.rejected_rows AS eligible_rows
FROM (SELECT (SELECT COUNT(*) FROM lesson35_incoming) AS input_rows,
             (SELECT COUNT(DISTINCT batch_row) FROM lesson35_issues) AS rejected_rows) AS totals;
SELECT SUM(oi.quantity * oi.unit_price) AS unchanged_revenue
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status IN ('paid', 'shipped');
DROP TEMPORARY TABLE lesson35_issues;
DROP TEMPORARY TABLE lesson35_incoming;
