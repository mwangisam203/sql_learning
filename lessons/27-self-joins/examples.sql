USE mysql_learning;

SELECT a.full_name AS first_customer, b.full_name AS second_customer, a.city
FROM customers AS a JOIN customers AS b
  ON b.city = a.city AND a.customer_id < b.customer_id
ORDER BY a.customer_id, b.customer_id;

WITH employees AS (
    SELECT 1 AS employee_id, 'Amina' AS employee_name, CAST(NULL AS SIGNED) AS manager_id
    UNION ALL SELECT 2, 'Brian', 1 UNION ALL SELECT 3, 'Chloe', 2
)
SELECT e.employee_name, COALESCE(m.employee_name, 'No manager') AS manager_name
FROM employees AS e LEFT JOIN employees AS m ON m.employee_id = e.manager_id
ORDER BY e.employee_id;
