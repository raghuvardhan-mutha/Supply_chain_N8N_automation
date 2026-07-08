# 📚 Data Dictionary

## Overview

The database follows a star-schema approach: fact tables hold transactional/measurement data, dimension tables hold descriptive attributes. Full DDL is in [`../sql/01_create_tables.sql`](../sql/01_create_tables.sql).

## dim_customers

Customer master data.

| Column | Type | Description |
|---|---|---|
| `customer_id` | INT (PK) | Unique identifier for each customer |
| `customer_name` | VARCHAR(100) | Customer name |
| `city` | VARCHAR(100) | Customer location |
| `currency` | VARCHAR(10) | Billing currency (USD / INR) |

Used for: customer analysis, revenue analysis, geographic analysis, currency mapping.

## dim_products

Product master data.

| Column | Type | Description |
|---|---|---|
| `product_id` | BIGINT (PK) | Unique product ID |
| `product_name` | VARCHAR(100) | Product name |
| `category` | VARCHAR(50) | Product category |
| `price_inr` | DECIMAL(10,2) | Unit price in INR |
| `price_usd` | DECIMAL(10,2) | Unit price in USD |

Used for: product analysis, revenue calculation, category performance, pricing analysis.

## dim_targets_orders

Target values for delivery KPIs, per customer.

| Column | Type | Description |
|---|---|---|
| `customer_id` | INT (FK → dim_customers) | Customer identifier |
| `ontime_target_percent` | INT | On-Time delivery target |
| `infull_target_percent` | INT | In-Full delivery target |
| `otif_target_percent` | INT | OTIF target |

Used to compare actual performance against target values.

## fact_order_line

Every individual product ordered by a customer (transactional grain).

| Column | Type | Description |
|---|---|---|
| `order_id` | VARCHAR(30) | Order identifier |
| `order_placement_date` | DATE | Date the order was placed |
| `customer_id` | INT (FK) | Customer |
| `product_id` | BIGINT (FK) | Product |
| `order_qty` | INT | Quantity ordered |
| `agreed_delivery_date` | DATE | Expected delivery date |
| `actual_delivery_date` | DATE | Actual delivery date |
| `delivery_qty` | INT | Quantity delivered |
| `in_full` | INT | 1 if the order line was delivered in full |
| `on_time` | INT | 1 if the order line was delivered on time |
| `on_time_in_full` | INT | 1 if the order line was both on-time and in-full |

Used to calculate: order value, product sales, delivery delay, fill rate, customer analysis.

## fact_aggregate

Order-level delivery performance (one row per order).

| Column | Type | Description |
|---|---|---|
| `order_id` | VARCHAR(30) (PK) | Order identifier |
| `customer_id` | INT (FK) | Customer |
| `order_placement_date` | DATE | Order date |
| `on_time` | INT | On-time delivery indicator |
| `in_full` | INT | In-full delivery indicator |
| `on_time_in_full` | INT | OTIF indicator |

Used for KPI calculations: OTIF %, On-Time %, In-Full %.

> **Note:** the source CSVs and the original n8n workflow used an inconsistent column name (`on time in full`, with spaces) in `fact_aggregate`. This has been standardized to `on_time_in_full` throughout the schema, SQL, and workflow in this repo — see [`../CHANGELOG.md`](../CHANGELOG.md).

## Supporting Tables

### dim_date
Calendar attributes (year, month, quarter, week, day) — used for trend analysis.

### exchange_rate
Daily USD → INR exchange rates — used for currency conversion and multi-country reporting.

## Relationships

```
dim_customers ─┬─> fact_order_line ─> fact_aggregate
               │
dim_products ──┘
               
dim_targets_orders ──> fact_aggregate (via customer_id)
exchange_rate ──> fact_order_line (via order_placement_date)
```

## Primary / Foreign Keys

| Table | Primary Key | Foreign Keys |
|---|---|---|
| `dim_customers` | `customer_id` | — |
| `dim_products` | `product_id` | — |
| `dim_targets_orders` | `customer_id` | `customer_id → dim_customers` |
| `fact_order_line` | `order_id + product_id` | `customer_id → dim_customers`, `product_id → dim_products` |
| `fact_aggregate` | `order_id` | `customer_id → dim_customers` |

## Summary

This dimensional model separates transactional data from descriptive attributes, enabling efficient querying, simpler reporting, and scalable business intelligence.

## Table Screenshots (Supabase Table Editor)

| Table | Screenshot |
|---|---|
| `dim_customers` | [`../images/supabase_dim_customers.png`](../images/supabase_dim_customers.png) |
| `dim_products` | [`../images/supabase_dim_products.png`](../images/supabase_dim_products.png) |
| `dim_targets_orders` | [`../images/supabase_dim_targets_orders.png`](../images/supabase_dim_targets_orders.png) |
| `fact_aggregate` | [`../images/supabase_fact_aggregate.png`](../images/supabase_fact_aggregate.png) |
| `fact_order_line` | [`../images/supabase_fact_order_line.png`](../images/supabase_fact_order_line.png) |
