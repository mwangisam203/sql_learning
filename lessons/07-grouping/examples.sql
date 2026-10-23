USE mysql_learning;

SELECT city, COUNT(*) AS customers FROM customers GROUP BY city ORDER BY city;
SELECT status, COUNT(*) AS orders_count FROM orders GROUP BY status ORDER BY status;
SELECT city, COUNT(*) AS customers FROM customers
GROUP BY city HAVING COUNT(*) >= 2 ORDER BY customers DESC, city;
