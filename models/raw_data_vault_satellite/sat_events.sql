{{ config(materialized='table') }}

SELECT  concat(venue_id,time) as event_id,
        cast(venue_id as INT) as venue_id,
        time,
        DATE(TIMESTAMP_MILLIS(time)) AS converted_time,
        status,
        duration,
        rsvp_limit,
        created,
        DATE(TIMESTAMP_MILLIS(created)) AS converted_created,
        CURRENT_DATE() AS load_date
 FROM raw.events as events
 WHERE status in ('upcoming','past')