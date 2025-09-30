{{
    config(
        materialized='table'
    )
}}

WITH trips as (
    select RIDE_ID,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
    START_STATIO_ID AS START_STATION_ID,
    END_STATION_ID,
    MEMBER_CSUAL AS MEMBER_CASUAL,
    TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT))  AS TRIP_DURATION
    from {{ ref('stg_bike') }}
    where RIDE_ID <> '"bikeid"' and ENDED_AT != '"stoptime"' and ENDED_AT != 'stoptime'
)
select * from trips