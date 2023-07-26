{{ config(materialized='table') }}

SELECT  concat(venue_id,time) as event_id,
        rsvps.user_id
 FROM raw.events as events, UNNEST(rsvps) as rsvps
 WHERE rsvps.response in ('yes','no')