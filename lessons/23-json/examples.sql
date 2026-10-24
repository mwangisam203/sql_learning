USE mysql_learning;

SET @document = JSON_OBJECT('sku', 'NOTE-01', 'color', 'blue');
SELECT JSON_UNQUOTE(JSON_EXTRACT(@document, '$.sku')) AS sku;
SET @payload = '[{"id":1,"quantity":2},{"id":5,"quantity":3}]';
SELECT j.product_id, j.quantity
FROM JSON_TABLE(@payload, '$[*]' COLUMNS (
    product_id INT PATH '$.id' ERROR ON EMPTY ERROR ON ERROR,
    quantity INT PATH '$.quantity' ERROR ON EMPTY ERROR ON ERROR
)) AS j ORDER BY j.product_id;
