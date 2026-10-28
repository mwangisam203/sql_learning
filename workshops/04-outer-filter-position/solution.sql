USE mysql_learning;

WITH parents AS (SELECT 1 AS parent_id UNION ALL SELECT 2),
children AS (
    SELECT 10 AS child_id, 1 AS parent_id, 'paid' AS status UNION ALL SELECT 11,2,'pending'
)
SELECT p.parent_id, COUNT(c.child_id) AS paid_count FROM parents AS p
LEFT JOIN children AS c ON c.parent_id = p.parent_id AND c.status = 'paid'
GROUP BY p.parent_id ORDER BY p.parent_id;
WITH parents AS (SELECT 1 AS parent_id UNION ALL SELECT 2),
children AS (
    SELECT 10 AS child_id, 1 AS parent_id, 'paid' AS status UNION ALL SELECT 11,2,'pending'
)
SELECT p.parent_id, COUNT(c.child_id) AS paid_count FROM parents AS p
LEFT JOIN children AS c ON c.parent_id = p.parent_id WHERE c.status = 'paid'
GROUP BY p.parent_id ORDER BY p.parent_id;
