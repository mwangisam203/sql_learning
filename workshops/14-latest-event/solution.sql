USE mysql_learning;

WITH incoming AS (
    SELECT 1 AS ingest_id, 'event-a' AS event_key,
           CAST('2025-01-01 09:00:00' AS DATETIME) AS received_at, 10 AS event_value
    UNION ALL SELECT 2,'event-a',CAST('2025-01-02 09:00:00' AS DATETIME),12
    UNION ALL SELECT 3,'event-b',CAST('2025-01-02 09:00:00' AS DATETIME),20
    UNION ALL SELECT 4,'event-b',CAST('2025-01-02 09:00:00' AS DATETIME),21
), ranked AS (
    SELECT ingest_id, event_key, event_value,
           ROW_NUMBER() OVER (PARTITION BY event_key ORDER BY received_at DESC,ingest_id DESC) AS position
    FROM incoming
)
SELECT ingest_id, event_key, event_value FROM ranked WHERE position = 1 ORDER BY event_key;
