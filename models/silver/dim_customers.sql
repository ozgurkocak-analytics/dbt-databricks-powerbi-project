select
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state,
    dbt_valid_from as valid_from,
    dbt_valid_to as valid_to,

    case 
        when dbt_valid_to is null then 1
        else 0
    end as is_current

from {{ ref('snp_customers') }}