# 🗄 Data Model

## Overview

The project uses a dimensional Star Schema to organize transactional and master data for reporting and KPI calculations. Full column-level detail lives in [`04_Data_Dictionary.md`](04_Data_Dictionary.md); DDL is in [`../sql/01_create_tables.sql`](../sql/01_create_tables.sql).

## Star Schema

```
                     dim_customers
                           │
                           ▼
                  fact_order_line
                           │
          ┌────────────────┼────────────────┐
          ▼                ▼                ▼
   dim_products    fact_aggregate   dim_targets_orders
                           │
                           ▼
                     exchange_rate
                           │
                           ▼
                        dim_date
```

## Fact Tables

**`fact_order_line`** — every product ordered by every customer. Order ID, customer, product, quantity, and both agreed and actual delivery dates. Supports product sales analysis, delivery performance, revenue analysis, and fill-rate calculation.

**`fact_aggregate`** — one row per order, summarizing on-time, in-full, and OTIF outcome. Drives KPI calculations directly.

## Dimension Tables

**`dim_customers`** — customer ID, name, city, currency. Supports customer-level analysis.

**`dim_products`** — product ID, name, category, and price in both INR and USD. Supports product analysis.

**`dim_targets_orders`** — On-Time / In-Full / OTIF targets per customer. Compares actual KPI values against business targets.

**`dim_date`** — calendar attributes (date, month, quarter, year). Supports trend analysis.

**`exchange_rate`** — daily USD → INR rates. Converts order values into a standardized currency for reporting.

## Relationships

| Relationship | Direction |
|---|---|
| Customer | `dim_customers → fact_order_line` |
| Product | `dim_products → fact_order_line` |
| Delivery Performance | `fact_order_line → fact_aggregate` |
| Target Comparison | `dim_targets_orders → fact_aggregate` |
| Currency Conversion | `exchange_rate → fact_order_line` |

## Primary / Foreign Keys

| Table | Primary Key |
|---|---|
| `dim_customers` | `customer_id` |
| `dim_products` | `product_id` |
| `dim_targets_orders` | `customer_id` |
| `fact_order_line` | `order_id + product_id` |
| `fact_aggregate` | `order_id` |

| Source | References |
|---|---|
| `fact_order_line.customer_id` | `dim_customers` |
| `fact_order_line.product_id` | `dim_products` |
| `fact_aggregate.customer_id` | `dim_customers` |

## Benefits

Faster analytical queries · reduced data redundancy · easier dashboard development · better scalability · simpler KPI calculations.

## Data Flow

```
Gmail → n8n Workflow → CSV Extraction → Supabase PostgreSQL
      → Fact & Dimension Tables → Quadratic → Business KPIs → Dashboard
```

## Conclusion

The dimensional model separates transactional data from descriptive business information, making it easier to perform supply chain analysis, calculate KPIs, and generate executive reports — following industry-standard data warehousing principles.
