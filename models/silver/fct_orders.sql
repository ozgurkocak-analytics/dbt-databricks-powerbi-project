select
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    o.order_status,
    o.order_purchase_timestamp,
    sum(oi.price + oi.freight_value) as order_total

from {{ ref('stg_orders') }} o
left join {{ ref('stg_customer') }} c
    on o.customer_id = c.customer_id
left join {{ ref('stg_order_items') }} oi
    on o.order_id = oi.order_id

group by
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    o.order_status,
    o.order_purchase_timestamp