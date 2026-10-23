USE mysql_learning;

SELECT customer_id, COUNT(*) AS order_count FROM orders
GROUP BY customer_id HAVING COUNT(*) >= 2 ORDER BY customer_id;
SELECT category, ROUND(AVG(price), 2) AS average_price FROM products
GROUP BY category HAVING AVG(price) > 10.00 ORDER BY category;
-- Expected categories: electronics (26.50), home (12.00), travel (30.00).
