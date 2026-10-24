USE mysql_learning;

WITH required_products AS (
    SELECT product_id FROM products WHERE category = 'stationery'
)
SELECT c.customer_id, c.full_name
FROM customers AS c JOIN orders AS o ON o.customer_id = c.customer_id
JOIN order_items AS oi ON oi.order_id = o.order_id
JOIN required_products AS r ON r.product_id = oi.product_id
WHERE o.status IN ('paid', 'shipped') GROUP BY c.customer_id, c.full_name
HAVING COUNT(DISTINCT oi.product_id) = (SELECT COUNT(*) FROM required_products)
ORDER BY c.customer_id;

WITH required_products AS (
    SELECT product_id FROM products WHERE category = 'stationery'
)
SELECT c.customer_id, c.full_name FROM customers AS c
WHERE NOT EXISTS (
    SELECT 1 FROM required_products AS r WHERE NOT EXISTS (
        SELECT 1 FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
        WHERE o.customer_id = c.customer_id AND o.status IN ('paid', 'shipped')
          AND oi.product_id = r.product_id
    )
) ORDER BY c.customer_id;
