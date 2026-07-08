# 🔄 Project Methodology

## Overview

This project follows a structured six-stage methodology that automates the complete supply chain reporting process, integrating workflow automation, cloud databases, SQL, and AI-assisted analytics.

1. Data Acquisition
2. Workflow Automation
3. Data Storage
4. Data Transformation
5. KPI Calculation
6. Dashboard & Reporting

## Stage 1 — Data Acquisition

Daily sales reports arrive through Gmail as CSV attachments containing customer orders, order line details, and delivery information.

## Stage 2 — Workflow Automation (n8n)

The n8n workflow (see [`../workflow.json`](../workflow.json)):

- Polls Gmail every minute for emails matching `subject:"Daily sales"`
- Downloads CSV attachments
- Extracts CSV data into structured records
- Routes data to the Postgres (Supabase) database

Setup guide: [`setup/01_N8N_Local_Setup.md`](setup/01_N8N_Local_Setup.md)

## Stage 3 — Data Storage (Supabase PostgreSQL)

Records are loaded into Supabase, organized into dimension tables (`dim_customers`, `dim_products`, `dim_targets_orders`) and fact tables (`fact_order_line`, `fact_aggregate`). Schema: [`04_Data_Dictionary.md`](04_Data_Dictionary.md). Setup guide: [`setup/02_Supabase_Setup.md`](setup/02_Supabase_Setup.md)

## Stage 4 — Data Transformation (Quadratic)

Quadratic connects directly to PostgreSQL and:

- Imports database tables
- Merges fact and dimension tables
- Generates a Date Dimension table
- Imports and applies exchange-rate data
- Cleans missing values and prepares analytical datasets

Python generated through AI assistance simplifies these transformation tasks.

## Stage 5 — KPI Calculation

KPIs are calculated using SQL queries ([`../sql/03_kpi_queries.sql`](../sql/03_kpi_queries.sql)) and Quadratic formulas/Python:

Total Orders · Total Order Lines · Order Value · Line Fill Rate · Volume Fill Rate · On-Time Delivery % · In-Full Delivery % · OTIF % · Revenue Loss · Average Delivery Delay

## Stage 6 — Dashboard & Reporting

The final dataset is visualized in Quadratic dashboards: Executive KPI Summary, Top 5 Customers (US), Top 5 Customers (India), Revenue Distribution, Delivery Performance, Fill Rate Analysis. See [`../dashboards/Quadratic_Dashboard.md`](../dashboards/Quadratic_Dashboard.md).

## Data Validation

- Verify incoming CSV structure
- Validate customer and product identifiers
- Standardize date formats
- Handle missing values and duplicate records
- Validate calculated KPIs against source data

## End-to-End Flow

```
Gmail → n8n Workflow → CSV Extraction → Supabase PostgreSQL
      → Quadratic → Data Transformation → KPI Calculation → Business Dashboard
```

## Conclusion

This methodology integrates workflow automation, cloud databases, and AI-assisted analytics into a single, scalable, reusable pipeline for supply chain performance monitoring.
