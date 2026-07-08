-- =====================================================
-- KPI Queries
-- =====================================================

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM fact_order_line;

-- Total Order Lines
SELECT COUNT(*) AS total_order_lines
FROM fact_order_line;

-- Line Fill Rate (% of order lines delivered completely)
SELECT ROUND(
    AVG(delivery_qty::decimal / NULLIF(order_qty, 0)) * 100,
    2
) AS line_fill_rate_pct
FROM fact_order_line;

-- Volume Fill Rate (% of ordered quantity delivered)
SELECT ROUND(
    SUM(delivery_qty::decimal) / NULLIF(SUM(order_qty), 0) * 100,
    2
) AS volume_fill_rate_pct
FROM fact_order_line;

-- On-Time Delivery %
SELECT ROUND(AVG(on_time::decimal) * 100, 2) AS on_time_pct
FROM fact_aggregate;

-- In-Full Delivery %
SELECT ROUND(AVG(in_full::decimal) * 100, 2) AS in_full_pct
FROM fact_aggregate;

-- On-Time In-Full (OTIF) %
SELECT ROUND(AVG(on_time_in_full::decimal) * 100, 2) AS otif_pct
FROM fact_aggregate;

-- Average Delivery Delay (days), late orders only
SELECT ROUND(
    AVG(actual_delivery_date - agreed_delivery_date), 2
) AS avg_delay_days
FROM fact_order_line
WHERE actual_delivery_date > agreed_delivery_date;
