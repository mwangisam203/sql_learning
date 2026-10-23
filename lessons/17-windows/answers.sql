USE mysql_learning;

WITH ranked_products AS (
    SELECT product_id, product_name, category, price,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC, product_id) AS position
    FROM products
)
SELECT category, product_name, price FROM ranked_products
WHERE position = 1 ORDER BY category;
