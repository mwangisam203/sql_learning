USE mysql_learning;

WITH metrics AS (
    SELECT 1 AS sample_id, 0 AS numerator, 5 AS denominator
    UNION ALL SELECT 2,5,0 UNION ALL SELECT 3,NULL,5
)
SELECT sample_id, CAST(numerator / NULLIF(denominator,0) AS DECIMAL(10,2)) AS rate,
       CASE WHEN numerator IS NULL OR denominator IS NULL THEN 'missing'
            WHEN denominator = 0 THEN 'undefined' ELSE 'measured' END AS reason
FROM metrics ORDER BY sample_id;
