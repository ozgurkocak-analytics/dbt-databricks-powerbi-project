with date_spine as (

    select explode(sequence(
        to_date('2016-01-01'),
        to_date('2018-12-31'),
        interval 1 day
    )) as date_day

)

select
    date_day,

    year(date_day) as year,
    month(date_day) as month,
    day(date_day) as day,

    date_format(date_day, 'yyyy-MM') as year_month,
    date_format(date_day, 'EEEE') as day_name,

    case when dayofweek(date_day) in (1,7) then 1 else 0 end as is_weekend

from date_spine