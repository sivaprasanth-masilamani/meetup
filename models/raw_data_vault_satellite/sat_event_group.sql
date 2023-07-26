{{ config(materialized='table') }}

SELECT  concat(venue_id,time) as event_id,
        group_id,
        name,
        description,
        CURRENT_DATE() AS load_date
 FROM raw.events as events, UNNEST(rsvps) as rsvps