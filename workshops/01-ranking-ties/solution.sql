USE mysql_learning;

WITH items AS (
    SELECT 1 AS item_id, 10 AS score UNION ALL SELECT 2,10 UNION ALL SELECT 3,5
)
SELECT item_id, score,
       ROW_NUMBER() OVER (ORDER BY score DESC, item_id) AS row_position,
       RANK() OVER (ORDER BY score DESC) AS tied_rank,
       DENSE_RANK() OVER (ORDER BY score DESC) AS dense_position
FROM items ORDER BY item_id;
