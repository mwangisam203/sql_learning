USE mysql_learning;

WITH order_totals AS (
    SELECT o.order_id, o.customer_id, SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY o.order_id, o.customer_id
), customer_report AS (
    SELECT c.customer_id, COUNT(t.order_id) AS completed_orders,
           COALESCE(SUM(t.order_total), 0.00) AS revenue
    FROM customers AS c LEFT JOIN order_totals AS t ON t.customer_id = c.customer_id
    GROUP BY c.customer_id
)
SELECT customer_id, completed_orders, revenue,
       DENSE_RANK() OVER (ORDER BY revenue DESC) AS spend_rank
FROM customer_report ORDER BY customer_id;
SELECT COUNT(DISTINCT CASE WHEN o.status IN ('paid', 'shipped') THEN o.order_id END) AS completed_orders,
       SUM(CASE WHEN o.status IN ('paid', 'shipped') THEN 1 ELSE 0 END) AS completed_lines,
       SUM(CASE WHEN o.status IN ('paid', 'shipped') THEN oi.quantity ELSE 0 END) AS completed_units,
       SUM(CASE WHEN o.status IN ('paid', 'shipped') THEN oi.quantity * oi.unit_price ELSE 0 END) AS completed_revenue,
       SUM(CASE WHEN o.status NOT IN ('paid', 'shipped') THEN oi.quantity * oi.unit_price ELSE 0 END) AS excluded_line_value,
       SUM(oi.quantity * oi.unit_price) AS all_line_value
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id;
