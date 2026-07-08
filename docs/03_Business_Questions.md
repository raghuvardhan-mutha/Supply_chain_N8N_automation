# ❓ Business Questions

## Overview

The following business questions guided the analysis of customer orders, delivery timelines, and fulfillment quality. They also form the original exercise brief this project was built against (Codebasics + Quadratic).

## Core Exercise Questions

1. What is the total revenue loss attributed to undelivered orders?
2. Which customers have the most significant On-Time In-Full (OTIF) discrepancies?
3. Which product categories exhibit the lowest In-Full delivery rates, and what might that indicate about supply chain bottlenecks?
4. What is the average delay time for late deliveries?
5. What additional insights would benefit stakeholders, viewed from their perspective?

## Extended Business Questions

### Customer Analysis
- Who are the top 5 customers by total order value (US and India)?
- Which customers have the highest / lowest OTIF percentage?
- Which cities and customer segments generate the most revenue?

### Product Analysis
- Which products generate the highest sales?
- Which products have the highest delivery delays or lowest fill rate?
- Which product categories contribute the most revenue, and which need inventory optimization?

### Delivery Performance
- What is the overall On-Time Delivery, In-Full Delivery, OTIF, Line Fill Rate, and Volume Fill Rate?

### Revenue Analysis
- What is the total order value, and how does it vary by country and customer?
- Which orders generated the highest revenue?

### Operational Analysis
- Which orders were delivered late, partially delivered, or failed OTIF?
- Which regions require operational improvement, and which KPIs fall below target?

## KPIs Used

Total Orders · Total Order Lines · Total Order Value · Line Fill Rate · Volume Fill Rate · On-Time Delivery % · In-Full Delivery % · OTIF % · Revenue Loss · Average Delivery Delay

## Where These Are Answered

- SQL: [`../sql/03_kpi_queries.sql`](../sql/03_kpi_queries.sql), [`../sql/04_analytical_queries.sql`](../sql/04_analytical_queries.sql)
- Dashboard: [`../dashboards/Quadratic_Dashboard.md`](../dashboards/Quadratic_Dashboard.md)
- Narrative answers: [`07_Business_Insights.md`](07_Business_Insights.md)

## Conclusion

These business questions form the foundation of the analytical workflow. By answering them using data stored in Supabase and analyzed in Quadratic, the project provides meaningful insight into supply chain performance and supports informed business decisions.

> Source exercise brief: Codebasics × Quadratic "Supply Chain Analytics" challenge.
