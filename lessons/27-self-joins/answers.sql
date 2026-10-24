USE mysql_learning;

SELECT a.customer_id AS first_id, b.customer_id AS second_id, a.city
FROM customers AS a JOIN customers AS b
  ON b.city = a.city AND a.customer_id < b.customer_id
ORDER BY a.customer_id, b.customer_id;
