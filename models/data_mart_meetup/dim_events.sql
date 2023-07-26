-- To add: meta data: load date and source

{{ config(materialized='table') }}

SELECT  hub.event_id,
        venue_id,
        time,
        DATE(TIMESTAMP_MILLIS(time)) AS converted_time,
        status,
        duration,
        rsvp_limit,
        created,
        DATE(TIMESTAMP_MILLIS(created)) AS converted_created
 FROM dbt_sivaprasanthmasilamani.hub_events as hub, dbt_sivaprasanthmasilamani.sat_events as sat
 WHERE hub.event_id = sat.event_id
 
 /*
 and sat.load_date =
       (
        SELECT
         MAX(s2.load_date)
        FROM
         dbt_sivaprasanthmasilamani.sat_events s2
        WHERE s2.event_id = hub.event_id
       )
*/