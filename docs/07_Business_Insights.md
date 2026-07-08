# 📈 Business Insights

## Overview

After integrating customer, product, order, delivery, target, and exchange-rate data, the Quadratic dashboard produced a consolidated view of supply chain performance across the US and India markets. Figures below are pulled directly from the dashboard — see [`../images/kpi-dashboard.png`](../images/kpi-dashboard.png) and [`../images/quadratic-dashboard.png`](../images/quadratic-dashboard.png).

## Executive KPI Summary

| KPI | Value |
|---|---|
| Total Orders | 3,380 |
| Total Order Lines | 12,390 |
| Line Fill Rate | 66.0% |
| Volume Fill Rate | 96.7% |
| On-Time Delivery % | 55.4% |
| In-Full Delivery % | 48.2% |
| On-Time In-Full (OTIF) % | 26.6% |

**Reading this:** Volume Fill Rate is high (96.7%) — when an order line does ship, it's nearly complete. But Line Fill Rate is much lower (66.0%), meaning a third of order *lines* don't ship at all. Combined with On-Time Delivery of only 55.4%, the OTIF result of 26.6% shows that timeliness, not partial-quantity shipping, is the bigger drag on OTIF — well below what any reasonable OTIF target (typically 90%+) would require.

## Customer Insights

### Top 5 Customers — United States (by order value, USD)

| Customer | City | Order Value | OTIF % | In-Full % | On-Time % |
|---|---|---|---|---|---|
| Whole Foods Market | New Jersey | $20.9M | 32.5 | 50.0 | 67.5 |
| Best Market | New Jersey | $20.7M | 33.8 | 48.1 | 68.8 |
| Price Rite | New Jersey | $20.6M | 6.1 | 13.4 | 67.1 |
| Foodtown | New Jersey | $20.4M | 24.4 | 46.5 | 64.0 |
| Lidl | New Jersey | $20.3M | 19.5 | 61.7 | 25.8 |

### Top 5 Customers — India (by order value)

| Customer | City | Order Value | OTIF % | In-Full % | On-Time % |
|---|---|---|---|---|---|
| Rel Fresh | Ahmedabad | ₹12.1M | 37.2 | 53.5 | 77.9 |
| Propel Mart | Vadodara | ₹11.8M | 37.7 | 58.4 | 75.3 |
| Acclaimed Stores | Vadodara | ₹11.6M | 17.5 | 62.5 | 25.0 |
| Acclaimed Stores | Ahmedabad | ₹11.1M | 21.2 | 70.8 | 29.2 |
| Elite Mart | Ahmedabad | ₹10.9M | 44.0 | 64.8 | 72.5 |

US top-5 accounts represent roughly **64%** of combined top-10 order value vs. **36%** for India top-5 — the US book of business is both larger and more concentrated.

**Notable outlier:** Price Rite (US) drives $20.6M in order value but an OTIF of just 6.1% — the weakest delivery performance of any top-tier account on either market. This is the single highest-priority account for delivery-performance remediation, since it combines high revenue exposure with the worst service level.

## Delivery Performance Insights

- **Volume Fill Rate** (96.7%) is the strongest metric — when product ships, it ships nearly complete.
- **Line Fill Rate** (66.0%) shows a meaningful share of order lines aren't shipped at all — likely a stocking or allocation issue rather than a partial-pick issue.
- **On-Time Delivery** (55.4%) and the resulting **OTIF** (26.6%) point to scheduling/logistics as the primary constraint, not inventory completeness.

## Product Insights

The integrated fact tables (`fact_order_line`, joined to `dim_products`) support analysis of product demand, category mix, order quantities, and delivery performance by product — see [`../sql/04_analytical_queries.sql`](../sql/04_analytical_queries.sql) for the category-level In-Full query.

## Geographic Insights

Comparing the US and India markets shows different demand and service profiles: the US book is larger by order value and more top-heavy, while India accounts show a wider spread of OTIF outcomes across a similar customer count.

## Operational Insights

The final dataset lets the business identify orders delivered late, orders delivered in full, orders that failed OTIF, high-value customers, and regional performance variations — the basis for the recommendations in [`08_Recommendations.md`](08_Recommendations.md).

## Business Value

These insights help the business improve delivery performance, reduce fulfillment issues, increase customer satisfaction, optimize inventory planning, and monitor operational KPIs on an ongoing basis.

## Conclusion

The gap between a strong Volume Fill Rate (96.7%) and a weak OTIF (26.6%) is the headline finding of this analysis: the supply chain is good at shipping complete orders, but poor at shipping them on time. That reframes where operational effort should go — logistics and scheduling, not inventory completeness.
