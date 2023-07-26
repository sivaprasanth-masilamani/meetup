{{ config(materialized='table') }}

SELECT  concat(venue_id,time) as event_id,
        rsvps.user_id,
        rsvps.when,
        DATE(TIMESTAMP_MILLIS(rsvps.when)) AS converted_when,
        rsvps.guests,
        rsvps.response,
        CURRENT_DATE() AS load_date
        --group_id,
        --name,
        --description
 FROM raw.events as events, UNNEST(rsvps) as rsvps
 WHERE rsvps.response in ('yes','no')