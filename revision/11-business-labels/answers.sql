USE mysql_learning;

WITH spend AS (
    SELECT o.customer_id, SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY o.customer_id
), everyone AS (
    SELECT c.customer_id, COALESCE(s.revenue, 0.00) AS revenue
    FROM customers AS c LEFT JOIN spend AS s ON s.customer_id = c.customer_id
)
SELECT customer_id, revenue, CASE WHEN revenue >= 60 THEN 'high'
                                WHEN revenue > 0 THEN 'some' ELSE 'none' END AS spend_band
FROM everyone ORDER BY customer_id;
SELECT SUM(CASE WHEN status = 'paid' THEN 1 ELSE 0 END) AS paid,
       SUM(CASE WHEN status = 'shipped' THEN 1 ELSE 0 END) AS shipped,
       SUM(CASE WHEN status = 'pending' THEN 1 ELSE 0 END) AS pending,
       SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled
FROM orders;
