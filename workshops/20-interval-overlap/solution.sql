USE mysql_learning;

WITH meetings AS (
    SELECT 1 AS meeting_id, CAST('2025-01-01 09:00:00' AS DATETIME) AS starts_at,
           CAST('2025-01-01 10:00:00' AS DATETIME) AS ends_at
    UNION ALL SELECT 2,CAST('2025-01-01 10:00:00' AS DATETIME),CAST('2025-01-01 11:00:00' AS DATETIME)
    UNION ALL SELECT 3,CAST('2025-01-01 09:30:00' AS DATETIME),CAST('2025-01-01 10:30:00' AS DATETIME)
)
SELECT a.meeting_id AS first_id, b.meeting_id AS second_id FROM meetings AS a
JOIN meetings AS b ON a.meeting_id < b.meeting_id
  AND a.starts_at < b.ends_at AND b.starts_at < a.ends_at
ORDER BY a.meeting_id,b.meeting_id;
