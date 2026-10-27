USE mysql_learning;

SELECT COUNT(*) AS total_customers, COUNT(phone) AS known_phones,
       COUNT(*) - COUNT(phone) AS missing_phones FROM customers;
WITH samples AS (
    SELECT 1 AS sample_id, CAST(NULL AS CHAR(8)) AS sample_value
    UNION ALL SELECT 2, '' UNION ALL SELECT 3, '0'
)
SELECT sample_id, CASE WHEN sample_value IS NULL THEN 'missing'
                      WHEN sample_value = '' THEN 'empty' ELSE 'present' END AS value_label
FROM samples ORDER BY sample_id;
