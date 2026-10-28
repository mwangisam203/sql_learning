USE mysql_learning;

WITH cart AS (
    SELECT 1 AS cart_row,1 AS product_id,101 AS quantity
    UNION ALL SELECT 2,2,2 UNION ALL SELECT 3,999,1 UNION ALL SELECT 4,3,0
), checked AS (
    SELECT c.cart_row,c.product_id,
           CASE WHEN p.product_id IS NULL THEN 'unknown_product'
                WHEN c.quantity IS NULL OR c.quantity <= 0 THEN 'invalid_quantity'
                WHEN c.quantity > p.stock THEN 'insufficient_stock' ELSE 'ok' END AS issue,
           CASE WHEN p.product_id IS NOT NULL AND c.quantity > 0 AND c.quantity <= p.stock
                THEN p.price * c.quantity ELSE NULL END AS eligible_value
    FROM cart AS c LEFT JOIN products AS p ON p.product_id = c.product_id
)
SELECT cart_row,product_id,issue,eligible_value FROM checked ORDER BY cart_row;
WITH cart AS (
    SELECT 1 AS cart_row,1 AS product_id,101 AS quantity
    UNION ALL SELECT 2,2,2 UNION ALL SELECT 3,999,1 UNION ALL SELECT 4,3,0
), checked AS (
    SELECT c.cart_row,
           CASE WHEN p.product_id IS NULL THEN 'unknown_product'
                WHEN c.quantity IS NULL OR c.quantity <= 0 THEN 'invalid_quantity'
                WHEN c.quantity > p.stock THEN 'insufficient_stock' ELSE 'ok' END AS issue,
           CASE WHEN p.product_id IS NOT NULL AND c.quantity > 0 AND c.quantity <= p.stock
                THEN p.price * c.quantity ELSE NULL END AS eligible_value
    FROM cart AS c LEFT JOIN products AS p ON p.product_id = c.product_id
)
SELECT SUM(CASE WHEN issue = 'ok' THEN 1 ELSE 0 END) AS valid_lines,
       SUM(CASE WHEN issue <> 'ok' THEN 1 ELSE 0 END) AS invalid_lines,
       COALESCE(SUM(eligible_value),0.00) AS eligible_quote_total FROM checked;
