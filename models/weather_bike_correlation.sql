{{
    config(
        materialized='table'
    )
}}

WITH CTE AS (
    select t.*,
    w.*
    FROM {{ ref('trip_fact') }} as t 
    left join {{ ref('daily_weather') }} w 
    ON t.TRIP_DATE =w.DAILYWEATHER
    ORDER BY t.TRIP_DATE desc
)
select * from CTE