USE mysql_learning;
SET @minimum_price = 30.00;
PREPARE product_lookup FROM
  'SELECT product_id, product_name, price FROM products WHERE price >= ? ORDER BY product_id';
EXECUTE product_lookup USING @minimum_price;
DEALLOCATE PREPARE product_lookup;
-- Expected: Keyboard (45.00) and Backpack (30.00), in ID order.
-- Placeholders bind values, not SQL grammar/identifiers. Use an allowlist.

-- After a MANUAL restore, run in the separate restore database:
-- USE mysql_learning_restore;
-- SELECT SUM(oi.quantity * oi.unit_price) AS revenue
-- FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
-- WHERE o.status IN ('paid', 'shipped');
-- Expected: 174.00.
