USE mysql_learning;

CREATE TEMPORARY TABLE lesson35_small_batch (
    batch_row INT PRIMARY KEY, external_id VARCHAR(20) NOT NULL
) ENGINE=InnoDB;
INSERT INTO lesson35_small_batch (batch_row, external_id)
VALUES (1, 'event-a'), (2, 'event-a'), (3, 'event-b');
SELECT batch_row, external_id, copies FROM (
    SELECT batch_row, external_id, COUNT(*) OVER (PARTITION BY external_id) AS copies
    FROM lesson35_small_batch
) AS counted WHERE copies > 1 ORDER BY batch_row;
DROP TEMPORARY TABLE lesson35_small_batch;
