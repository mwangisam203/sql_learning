USE mysql_learning;

CREATE TEMPORARY TABLE workshop21_contacts (
    contact_id INT PRIMARY KEY, email VARCHAR(100) NULL UNIQUE
) ENGINE=InnoDB;
INSERT INTO workshop21_contacts (contact_id,email) VALUES (1,NULL),(2,NULL),(3,'a@example.test');
SELECT COUNT(*) AS row_count, COUNT(email) AS known_emails FROM workshop21_contacts;
SELECT COALESCE(email,'(missing)') AS email_label, COUNT(*) AS contacts
FROM workshop21_contacts GROUP BY email ORDER BY email;
DROP TEMPORARY TABLE workshop21_contacts;
