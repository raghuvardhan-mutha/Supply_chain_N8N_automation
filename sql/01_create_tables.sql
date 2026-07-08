-- =====================================================
-- Supply Chain Analytics — Database Schema
-- Run this first to create all dimension and fact tables
-- =====================================================

-- ==========================================
-- Dimension Table: Customers
-- ==========================================
CREATE TABLE dim_customers (
    customer_id     INT PRIMARY KEY,
    customer_name   VARCHAR(100),
    city            VARCHAR(100),
    currency        VARCHAR(10)
);

-- ==========================================
-- Dimension Table: Products
-- ==========================================
CREATE TABLE dim_products (
    product_id      BIGINT PRIMARY KEY,
    product_name    VARCHAR(100),
    category        VARCHAR(50),
    price_inr       DECIMAL(10,2),
    price_usd       DECIMAL(10,2)
);

-- ==========================================
-- Dimension Table: Customer Delivery Targets
-- ==========================================
CREATE TABLE dim_targets_orders (
    customer_id             INT REFERENCES dim_customers(customer_id),
    ontime_target_percent   INT,
    infull_target_percent   INT,
    otif_target_percent     INT
);

-- ==========================================
-- Fact Table: Order Line (transactional grain)
-- ==========================================
CREATE TABLE fact_order_line (
    order_id                VARCHAR(30),
    order_placement_date    DATE,
    customer_id             INT REFERENCES dim_customers(customer_id),
    product_id              BIGINT REFERENCES dim_products(product_id),
    order_qty               INT,
    agreed_delivery_date    DATE,
    actual_delivery_date    DATE,
    delivery_qty             INT,
    in_full                 INT,
    on_time                 INT,
    on_time_in_full          INT,
    PRIMARY KEY (order_id, product_id)
);

-- ==========================================
-- Fact Table: Aggregate (order-level delivery outcome)
-- ==========================================
CREATE TABLE fact_aggregate (
    order_id             VARCHAR(30) PRIMARY KEY,
    customer_id          INT REFERENCES dim_customers(customer_id),
    order_placement_date DATE,
    on_time              INT,
    in_full              INT,
    on_time_in_full       INT
);

-- ==========================================
-- Supporting Table: Date Dimension
-- ==========================================
CREATE TABLE dim_date (
    calendar_date   DATE PRIMARY KEY,
    year            INT,
    month           INT,
    quarter         INT,
    week            INT,
    day             INT
);

-- ==========================================
-- Supporting Table: Exchange Rates
-- ==========================================
CREATE TABLE exchange_rate (
    exchange_date   DATE PRIMARY KEY,
    usd_to_inr      DECIMAL(10,4)
);
