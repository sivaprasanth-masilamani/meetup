
{{ config(materialized='table') }}

SELECT  concat(venue_id,time) as event_id
        ,CURRENT_DATE() AS load_date
FROM raw.events as events
WHERE status in ('upcoming','past')