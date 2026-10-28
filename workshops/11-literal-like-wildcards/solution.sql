USE mysql_learning;

WITH labels AS (
    SELECT 1 AS label_id, '50% off' AS label UNION ALL SELECT 2,'500 off' UNION ALL SELECT 3,'50_ off'
)
SELECT label_id, label FROM labels WHERE label LIKE '50!%%' ESCAPE '!' ORDER BY label_id;
WITH labels AS (
    SELECT 1 AS label_id, '50% off' AS label UNION ALL SELECT 2,'500 off' UNION ALL SELECT 3,'50_ off'
)
SELECT label_id, label FROM labels WHERE label LIKE '50!_%' ESCAPE '!' ORDER BY label_id;
