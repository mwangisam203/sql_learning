USE mysql_learning;

SELECT customer_id, full_name FROM customers
WHERE phone IS NULL ORDER BY customer_id;
SELECT full_name, COALESCE(phone, 'Not supplied') AS contact_phone
FROM customers ORDER BY customer_id;
SELECT NULL = NULL AS ordinary_equality,
       NULL <=> NULL AS null_safe_equality, 10 + NULL AS missing_math;
