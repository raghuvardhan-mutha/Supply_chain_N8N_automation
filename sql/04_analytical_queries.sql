-- =====================================================
-- Analytical Queries
-- =====================================================

-- Top 10 Customers by Order Value (USD)
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    SUM(f.order_qty * p.price_usd) AS total_order_value_usd
FROM fact_order_line f
JOIN dim_customers c ON f.customer_id = c.customer_id
JOIN dim_products  p ON f.product_id  = p.product_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_order_value_usd DESC
LIMIT 10;

-- Top 10 Products by Order Quantity
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(f.order_qty) AS total_quantity_ordered
FROM fact_order_line f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_quantity_ordered DESC
LIMIT 10;

-- Orders Delivered Late
SELECT
    order_id,
    customer_id,
    product_id,
    agreed_delivery_date,
    actual_delivery_date,
    (actual_delivery_date - agreed_delivery_date) AS days_late
FROM fact_order_line
WHERE actual_delivery_date > agreed_delivery_date
ORDER BY days_late DESC;

-- Revenue Loss from Undelivered Orders
SELECT
    c.customer_name,
    SUM((f.order_qty - f.delivery_qty) * p.price_usd) AS revenue_loss_usd
FROM fact_order_line f
JOIN dim_customers c ON f.customer_id = c.customer_id
JOIN dim_products  p ON f.product_id  = p.product_id
WHERE f.delivery_qty < f.order_qty
GROUP BY c.customer_name
ORDER BY revenue_loss_usd DESC;

-- Customers with the Largest OTIF Gap vs Target
SELECT
    c.customer_name,
    ROUND(AVG(a.on_time_in_full::decimal) * 100, 2) AS actual_otif_pct,
    t.otif_target_percent,
    ROUND(AVG(a.on_time_in_full::decimal) * 100, 2) - t.otif_target_percent AS otif_gap
FROM fact_aggregate a
JOIN dim_customers c        ON a.customer_id = c.customer_id
JOIN dim_targets_orders t   ON a.customer_id = t.customer_id
GROUP BY c.customer_name, t.otif_target_percent
ORDER BY otif_gap ASC;

-- Product Categories with the Lowest In-Full Delivery Rate
SELECT
    p.category,
    ROUND(AVG(f.delivery_qty::decimal / NULLIF(f.order_qty, 0)) * 100, 2) AS in_full_rate_pct
FROM fact_order_line f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY in_full_rate_pct ASC;
