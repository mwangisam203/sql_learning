USE mysql_learning;

SELECT c.customer_id, c.full_name, COUNT(o.order_id) AS all_status_orders
FROM customers AS c LEFT JOIN orders AS o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name ORDER BY c.customer_id;

SELECT c.customer_id, c.full_name FROM customers AS c
LEFT JOIN orders AS o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL ORDER BY c.customer_id;

SELECT c.customer_id, c.full_name, COUNT(o.order_id) AS completed_orders
FROM customers AS c LEFT JOIN orders AS o
  ON o.customer_id = c.customer_id AND o.status IN ('paid', 'shipped')
GROUP BY c.customer_id, c.full_name ORDER BY c.customer_id;
