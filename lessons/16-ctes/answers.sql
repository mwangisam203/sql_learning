USE mysql_learning;

WITH completed_customer_totals AS (
    SELECT o.customer_id, SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY o.customer_id
)
SELECT c.customer_id, c.full_name, t.revenue FROM customers AS c
JOIN completed_customer_totals AS t ON t.customer_id = c.customer_id
WHERE t.revenue >= 50.00 ORDER BY c.customer_id;
