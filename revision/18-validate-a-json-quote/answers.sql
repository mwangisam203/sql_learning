USE mysql_learning;

SET @revision_quote = '[{"id":1,"quantity":2},{"id":5,"quantity":3},{"id":999,"quantity":1}]';
SELECT j.product_id, p.product_name, j.quantity,
       CASE WHEN p.product_id IS NOT NULL AND j.quantity > 0
            THEN p.price * j.quantity ELSE NULL END AS quote_value,
       CASE WHEN p.product_id IS NULL THEN 'unknown_product'
            WHEN j.quantity IS NULL OR j.quantity <= 0 THEN 'invalid_quantity'
            ELSE 'ok' END AS issue
FROM JSON_TABLE(@revision_quote, '$[*]' COLUMNS (
    product_id INT PATH '$.id' ERROR ON EMPTY ERROR ON ERROR,
    quantity INT PATH '$.quantity' NULL ON EMPTY ERROR ON ERROR
)) AS j LEFT JOIN products AS p ON p.product_id = j.product_id ORDER BY j.product_id;
SELECT COUNT(*) AS valid_lines, SUM(p.price * j.quantity) AS total_quote
FROM JSON_TABLE(@revision_quote, '$[*]' COLUMNS (
    product_id INT PATH '$.id' ERROR ON EMPTY ERROR ON ERROR,
    quantity INT PATH '$.quantity' NULL ON EMPTY ERROR ON ERROR
)) AS j JOIN products AS p ON p.product_id = j.product_id WHERE j.quantity > 0;
