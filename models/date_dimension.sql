WITH CTE AS (
    select 
    TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
    date(TO_TIMESTAMP(STARTED_AT)) as date_started_at,
    hour(TO_TIMESTAMP(STARTED_AT)) as hour_started_at,
    
    {{day_type('STARTED_AT')}} AS DAY_TYPE,
    {{get_season('STARTED_AT')}} AS STATION_OF_YEAR

    from 
    {{ source('demo', 'bike') }}
    where STARTED_AT <> 'started_at'
)
SELECT 
* FROM CTE