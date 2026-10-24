USE mysql_learning;

WITH RECURSIVE calendar AS (
    SELECT CAST('2025-01-01' AS DATE) AS month_start
    UNION ALL SELECT DATE_ADD(month_start, INTERVAL 1 MONTH)
    FROM calendar WHERE month_start < '2025-04-01'
), monthly_revenue AS (
    SELECT DATE_FORMAT(o.ordered_at, '%Y-%m') AS month,
           SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped')
      AND o.ordered_at >= '2025-01-01' AND o.ordered_at < '2025-05-01'
    GROUP BY DATE_FORMAT(o.ordered_at, '%Y-%m')
)
SELECT DATE_FORMAT(c.month_start, '%Y-%m') AS month, COALESCE(m.revenue, 0.00) AS revenue
FROM calendar AS c LEFT JOIN monthly_revenue AS m
  ON m.month = DATE_FORMAT(c.month_start, '%Y-%m')
ORDER BY c.month_start;
