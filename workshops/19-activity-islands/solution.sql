USE mysql_learning;

WITH activity AS (
    SELECT CAST('2025-01-01' AS DATE) AS active_on
    UNION ALL SELECT CAST('2025-01-02' AS DATE) UNION ALL SELECT CAST('2025-01-02' AS DATE)
    UNION ALL SELECT CAST('2025-01-04' AS DATE) UNION ALL SELECT CAST('2025-01-07' AS DATE)
    UNION ALL SELECT CAST('2025-01-08' AS DATE)
), days AS (SELECT DISTINCT active_on FROM activity),
numbered AS (SELECT active_on, ROW_NUMBER() OVER (ORDER BY active_on) AS sequence_no FROM days),
islands AS (SELECT active_on, DATE_SUB(active_on,INTERVAL sequence_no DAY) AS island_key FROM numbered)
SELECT MIN(active_on) AS first_day, MAX(active_on) AS last_day, COUNT(*) AS active_days
FROM islands GROUP BY island_key ORDER BY first_day;
