USE mysql_learning;

WITH documents AS (
    SELECT 1 AS document_id, '[]' AS lines_json
    UNION ALL SELECT 2,'[{"q":2},{"q":3}]'
)
SELECT d.document_id, COUNT(j.line_no) AS line_count, COALESCE(SUM(j.quantity),0) AS units
FROM documents AS d LEFT JOIN JSON_TABLE(d.lines_json,'$[*]' COLUMNS (
    line_no FOR ORDINALITY, quantity INT PATH '$.q' ERROR ON EMPTY ERROR ON ERROR
)) AS j ON TRUE GROUP BY d.document_id ORDER BY d.document_id;
