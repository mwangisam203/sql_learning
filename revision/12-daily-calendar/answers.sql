USE mysql_learning;

SELECT o.order_id, DATE_FORMAT(o.ordered_at, '%Y-%m-%d') AS order_day,
       SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status IN ('paid', 'shipped')
  AND o.ordered_at >= '2025-03-01' AND o.ordered_at < '2025-03-07'
GROUP BY o.order_id, o.ordered_at ORDER BY o.order_id;
WITH RECURSIVE calendar AS (
    SELECT CAST('2025-03-01' AS DATE) AS day
    UNION ALL SELECT DATE_ADD(day, INTERVAL 1 DAY) FROM calendar WHERE day < '2025-03-06'
), daily AS (
    SELECT DATE(o.ordered_at) AS day, SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped')
      AND o.ordered_at >= '2025-03-01' AND o.ordered_at < '2025-03-07'
    GROUP BY DATE(o.ordered_at)
)
SELECT c.day, COALESCE(d.revenue, 0.00) AS revenue FROM calendar AS c
LEFT JOIN daily AS d ON d.day = c.day ORDER BY c.day;
