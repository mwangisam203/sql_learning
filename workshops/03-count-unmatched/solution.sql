USE mysql_learning;

WITH parents AS (SELECT 1 AS parent_id UNION ALL SELECT 2),
children AS (SELECT 10 AS child_id, 1 AS parent_id UNION ALL SELECT 11,1)
SELECT p.parent_id, COUNT(*) AS joined_rows, COUNT(c.child_id) AS child_count
FROM parents AS p LEFT JOIN children AS c ON c.parent_id = p.parent_id
GROUP BY p.parent_id ORDER BY p.parent_id;
