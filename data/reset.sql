-- DESTRUCTIVE: replaces only course objects in the disposable database.
-- Run from the repository root: mysql -u root -p < data/reset.sql
-- SOURCE paths are relative to the client's working directory.
CREATE DATABASE IF NOT EXISTS mysql_learning
  CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE mysql_learning;
DROP VIEW IF EXISTS v_order_totals;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
SOURCE data/schema.sql;
SOURCE data/seed.sql;
