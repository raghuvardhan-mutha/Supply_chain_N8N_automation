-- =====================================================
-- Reporting View
-- Flattens order line, customer, product, and delivery
-- outcome into a single analysis-ready view.
-- =====================================================

CREATE OR REPLACE VIEW vw_supply_chain_summary AS
SELECT
    f.order_id,
    f.customer_id,
    c.customer_name,
    c.city,
    c.currency,
    p.product_name,
    p.category,
    f.order_qty,
    f.delivery_qty,
    f.agreed_delivery_date,
    f.actual_delivery_date,
    a.on_time,
    a.in_full,
    a.on_time_in_full
FROM fact_order_line f
JOIN dim_customers  c ON f.customer_id = c.customer_id
JOIN dim_products   p ON f.product_id  = p.product_id
JOIN fact_aggregate  a ON f.order_id    = a.order_id;
