USE mysql_learning;

WITH sessions AS (
    SELECT 1 AS session_id, CAST('2025-01-01 23:59:00' AS DATETIME) AS starts_at,
           CAST('2025-01-02 00:01:00' AS DATETIME) AS ends_at
    UNION ALL SELECT 2,CAST('2025-01-01 00:00:00' AS DATETIME),CAST('2025-01-01 23:00:00' AS DATETIME)
)
SELECT session_id, DATEDIFF(ends_at,starts_at) AS calendar_days,
       TIMESTAMPDIFF(MINUTE,starts_at,ends_at) AS elapsed_minutes
FROM sessions ORDER BY session_id;
