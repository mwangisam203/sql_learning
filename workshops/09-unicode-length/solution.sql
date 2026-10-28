USE mysql_learning;

WITH samples AS (
    SELECT 1 AS sample_id, _utf8mb4'café' AS text_value UNION ALL SELECT 2,_utf8mb4'猫'
)
SELECT sample_id, text_value, CHAR_LENGTH(text_value) AS characters,
       LENGTH(text_value) AS bytes FROM samples ORDER BY sample_id;
