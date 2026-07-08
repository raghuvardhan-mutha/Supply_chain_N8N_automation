# 📈 Quadratic Dashboard

## Overview

The dashboard was built in [Quadratic](https://www.quadratichq.com/), which combines SQL, Python, and spreadsheet functionality, enabling fast analysis of operational data stored directly in Supabase PostgreSQL.

![Quadratic Dashboard](../images/quadratic-dashboard.png)

## Dashboard Features

- KPI Summary
- Top 5 Customers (US)
- Top 5 Customers (India)
- Order Value Share: US vs. India
- Delivery & Fill Rate KPIs (On-Time, In-Full, OTIF, Line Fill, Volume Fill)

## Data Sources

The dashboard queries Supabase directly:

- `fact_order_line`
- `fact_aggregate`
- `dim_customers`
- `dim_products`
- `dim_targets_orders`
- `dim_date`
- `exchange_rate`

## Dashboard Workflow

```
Supabase → Quadratic Connection → Data Import → Transformation
         → KPI Calculation → Charts → Business Insights
```

## How the Connection Works

1. In Quadratic, create a new sheet and add a **Postgres connection**, using the Supabase session-pooler parameters from [`../docs/setup/02_Supabase_Setup.md`](../docs/setup/02_Supabase_Setup.md).
2. Each table (`dim_customers`, `dim_products`, `dim_targets_orders`, `fact_aggregate`, `fact_order_line`) is pulled in as its own sheet tab.
3. A Python cell merges the fact and dimension tables, generates `dim_date` and applies `exchange_rate`, and writes the results to a `fact_summary` tab.
4. A `KPI` tab computes the metrics in [`../dashboards/KPI_Report.md`](KPI_Report.md) from `fact_summary`.
5. The `Dashboard` tab renders the charts shown above from the `KPI` and `Reports` tabs.

## Analytical Capabilities

Customer analysis · Product analysis · Revenue analysis · Delivery performance · Fill rate analysis · Trend analysis

## Benefits

The dashboard lets business users monitor KPIs, identify operational issues, track customer performance, analyze fulfillment quality, and support data-driven decisions — all from a single, live-connected sheet.

## Conclusion

Quadratic serves as the final presentation layer of the pipeline, turning the Supabase warehouse into actionable business insight without a separate BI tool. Full result narrative: [`../docs/07_Business_Insights.md`](../docs/07_Business_Insights.md).
