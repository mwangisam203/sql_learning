USE mysql_learning;

SET @workshop_document = '{"present":null,"empty":""}';
WITH paths AS (
    SELECT 1 AS position, 'explicit_null' AS field_label, '$.present' AS json_path
    UNION ALL SELECT 2,'absent','$.absent' UNION ALL SELECT 3,'empty_text','$.empty'
)
SELECT field_label, JSON_CONTAINS_PATH(@workshop_document,'one',json_path) AS path_exists,
       CASE WHEN JSON_EXTRACT(@workshop_document,json_path) IS NULL THEN 'missing'
            WHEN JSON_TYPE(JSON_EXTRACT(@workshop_document,json_path)) = 'NULL' THEN 'json_null'
            ELSE JSON_TYPE(JSON_EXTRACT(@workshop_document,json_path)) END AS kind
FROM paths ORDER BY position;
