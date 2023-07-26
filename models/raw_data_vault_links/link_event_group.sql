{{ config(materialized='table') }}

SELECT  concat(venue_id,time) as event_id,
        group_id
        --name,
        --description
 FROM raw.events as events