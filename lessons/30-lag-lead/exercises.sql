-- Use the mysql_learning seed. Write your SQL below the prompts.

-- 1. For paid/shipped orders only, calculate previous_order_id, next_order_id,
--    and previous_order_at using LAG/LEAD ordered by ordered_at and order_id.
-- 2. Return order_id, previous_order_id, next_order_id, and calendar_days_since_previous.
--    Use a CTE, sort by ordered_at/order_id, and keep missing neighbors as NULL.
