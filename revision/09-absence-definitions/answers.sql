USE mysql_learning;

SELECT c.customer_id, c.full_name FROM customers AS c
WHERE NOT EXISTS (SELECT 1 FROM orders AS o WHERE o.customer_id = c.customer_id)
ORDER BY c.customer_id;
SELECT c.customer_id, c.full_name FROM customers AS c
WHERE NOT EXISTS (SELECT 1 FROM orders AS o WHERE o.customer_id = c.customer_id
                  AND o.status IN ('paid', 'shipped'))
ORDER BY c.customer_id;
