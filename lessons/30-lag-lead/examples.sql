USE mysql_learning;

WITH monthly AS (
    SELECT DATE_FORMAT(o.ordered_at, '%Y-%m') AS month,
           SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY DATE_FORMAT(o.ordered_at, '%Y-%m')
), compared AS (
    SELECT month, revenue, LAG(revenue) OVER (ORDER BY month) AS previous_revenue
    FROM monthly
)
SELECT month, revenue, previous_revenue,
       CAST(100 * (revenue - previous_revenue) / NULLIF(previous_revenue, 0)
            AS DECIMAL(10,2)) AS growth_percent
FROM compared ORDER BY month;
