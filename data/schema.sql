-- Run through data/reset.sql for a complete initial setup.
CREATE DATABASE IF NOT EXISTS mysql_learning
  CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE mysql_learning;

CREATE TABLE customers (
    customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(254) NOT NULL,
    city VARCHAR(80) NOT NULL,
    phone VARCHAR(30) NULL,
    joined_on DATE NOT NULL,
    PRIMARY KEY (customer_id),
    UNIQUE KEY uq_customers_email (email)
) ENGINE=InnoDB;

CREATE TABLE products (
    product_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(40) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    PRIMARY KEY (product_id),
    CONSTRAINT chk_products_price CHECK (price >= 0),
    CONSTRAINT chk_products_stock CHECK (stock >= 0)
) ENGINE=InnoDB;

CREATE TABLE orders (
    order_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id INT UNSIGNED NOT NULL,
    ordered_at DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    PRIMARY KEY (order_id),
    KEY idx_orders_customer (customer_id),
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id)
      REFERENCES customers (customer_id),
    CONSTRAINT chk_orders_status
      CHECK (status IN ('pending', 'paid', 'shipped', 'cancelled'))
) ENGINE=InnoDB;

CREATE TABLE order_items (
    order_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_items_order FOREIGN KEY (order_id)
      REFERENCES orders (order_id),
    CONSTRAINT fk_items_product FOREIGN KEY (product_id)
      REFERENCES products (product_id),
    CONSTRAINT chk_items_quantity CHECK (quantity > 0),
    CONSTRAINT chk_items_price CHECK (unit_price >= 0)
) ENGINE=InnoDB;
