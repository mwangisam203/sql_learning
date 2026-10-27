USE mysql_learning;

SELECT customer_id, COUNT(*) AS completed_orders FROM orders
WHERE status IN ('paid', 'shipped') GROUP BY customer_id
HAVING COUNT(*) >= 2 ORDER BY customer_id;
SELECT city, COUNT(*) AS customer_count FROM customers GROUP BY city
HAVING COUNT(*) >= 2 ORDER BY city;
