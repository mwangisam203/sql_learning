USE mysql_learning;

WITH observations AS (
    SELECT 1 AS observation_id, 10 AS reading UNION ALL SELECT 2,20 UNION ALL SELECT 3,30
)
SELECT observation_id,
       LAST_VALUE(reading) OVER (ORDER BY observation_id) AS default_last,
       LAST_VALUE(reading) OVER (ORDER BY observation_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS partition_last
FROM observations ORDER BY observation_id;
