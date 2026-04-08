{% snapshot snp_customers %}

{{
    config(
        target_schema='silver',
        unique_key='customer_id',
        strategy='check',
        check_cols=['customer_city', 'customer_state']
    )
}}

select
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
from {{ ref('stg_customer') }}

{% endsnapshot %}