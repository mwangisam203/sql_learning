-- Load only into the empty course tables; this is not an upsert script.
USE mysql_learning;
START TRANSACTION;
INSERT INTO customers
    (customer_id, full_name, email, city, phone, joined_on)
VALUES
    (1, 'Amina Otieno', 'amina@example.test', 'Nairobi', NULL, '2025-01-02'),
    (2, 'Brian Mwangi', 'brian@example.test', 'Mombasa', '+254700000002', '2025-01-03'),
    (3, 'Chloe Njeri', 'chloe@example.test', 'Nairobi', NULL, '2025-02-01'),
    (4, 'Diego Kamau', 'diego@example.test', 'Kisumu', '+254700000004', '2025-02-10'),
    (5, 'Ella Wanjiku', 'ella@example.test', 'Mombasa', NULL, '2025-02-25'),
    (6, 'Farah Ali', 'farah@example.test', 'Nairobi', NULL, '2025-03-01');
INSERT INTO products (product_id, product_name, category, price, stock)
VALUES
    (1, 'Notebook', 'stationery', 4.50, 100),
    (2, 'Pen', 'stationery', 1.50, 200),
    (3, 'Mug', 'home', 12.00, 40),
    (4, 'Keyboard', 'electronics', 45.00, 15),
    (5, 'Cable', 'electronics', 8.00, 60),
    (6, 'Backpack', 'travel', 30.00, 20);
INSERT INTO orders (order_id, customer_id, ordered_at, status)
VALUES
    (1, 1, '2025-01-05 09:00:00', 'paid'),
    (2, 2, '2025-01-10 10:30:00', 'shipped'),
    (3, 1, '2025-02-02 12:00:00', 'shipped'),
    (4, 3, '2025-02-14 08:15:00', 'pending'),
    (5, 4, '2025-02-20 16:45:00', 'cancelled'),
    (6, 2, '2025-03-01 11:00:00', 'paid'),
    (7, 5, '2025-03-03 14:20:00', 'shipped'),
    (8, 3, '2025-03-05 09:10:00', 'paid');
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
    (1, 1, 2, 4.50), (1, 2, 3, 1.50),
    (2, 3, 1, 12.00), (2, 5, 2, 8.00),
    (3, 4, 1, 45.00), (3, 5, 1, 8.00),
    (4, 1, 5, 4.50), (5, 4, 1, 45.00),
    (6, 2, 10, 1.50), (6, 3, 2, 12.00),
    (7, 5, 3, 8.00),
    (8, 1, 1, 4.50), (8, 3, 1, 12.00);
COMMIT;
