select
    f.order_id,
    f.order_purchase_timestamp,
    date(f.order_purchase_timestamp) as order_date,  -- we added this to join the dim_date in Power BI
    f.order_status,
    f.order_total,
    d.customer_unique_id,
    d.customer_city,
    d.customer_state

from {{ ref('fct_orders') }} f
left join {{ ref('dim_customers') }} d
    on f.customer_id = d.customer_id
    and d.is_current = 1