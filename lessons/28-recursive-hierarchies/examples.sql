USE mysql_learning;

WITH RECURSIVE employees AS (
    SELECT 1 AS employee_id, 'Amina' AS employee_name, CAST(NULL AS SIGNED) AS manager_id
    UNION ALL SELECT 2, 'Brian', 1 UNION ALL SELECT 3, 'Chloe', 1
    UNION ALL SELECT 4, 'Diego', 2 UNION ALL SELECT 5, 'Ella', 2
    UNION ALL SELECT 6, 'Farah', 4
), hierarchy AS (
    SELECT employee_id, employee_name, 0 AS depth,
           CAST(employee_name AS CHAR(200)) AS path
    FROM employees WHERE employee_id = 1
    UNION ALL
    SELECT e.employee_id, e.employee_name, h.depth + 1,
           CONCAT(h.path, ' > ', e.employee_name)
    FROM employees AS e JOIN hierarchy AS h ON e.manager_id = h.employee_id
    WHERE h.depth < 10
)
SELECT employee_id, employee_name, depth, path FROM hierarchy ORDER BY path;
