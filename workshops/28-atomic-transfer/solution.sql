USE mysql_learning;

CREATE TEMPORARY TABLE workshop28_accounts (
    account_id INT PRIMARY KEY, balance DECIMAL(10,2) NOT NULL CHECK (balance >= 0)
) ENGINE=InnoDB;
INSERT INTO workshop28_accounts (account_id,balance) VALUES (101,100),(202,50);
START TRANSACTION;
UPDATE workshop28_accounts SET balance = balance - 20 WHERE account_id = 101 AND balance >= 20;
SET @workshop_debit_ok = ROW_COUNT();
UPDATE workshop28_accounts SET balance = balance + 20 WHERE account_id = 202 AND @workshop_debit_ok = 1;
SELECT ROW_COUNT() AS credited_rows;
SELECT account_id,balance FROM workshop28_accounts ORDER BY account_id;
ROLLBACK;
SELECT account_id,balance FROM workshop28_accounts ORDER BY account_id;
START TRANSACTION;
UPDATE workshop28_accounts SET balance = balance - 999 WHERE account_id = 101 AND balance >= 999;
SET @workshop_debit_ok = ROW_COUNT();
UPDATE workshop28_accounts SET balance = balance + 999 WHERE account_id = 202 AND @workshop_debit_ok = 1;
SELECT @workshop_debit_ok AS debited_rows, ROW_COUNT() AS credited_rows;
ROLLBACK;
DROP TEMPORARY TABLE workshop28_accounts;
