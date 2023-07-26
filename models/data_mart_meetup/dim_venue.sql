-- To add: meta data: load date and source

{{ config(materialized='table') }}

SELECT  hub.venue_id,               
        name,           
        city,                   
        country,        
        lat,
        lon,
 FROM dbt_sivaprasanthmasilamani.hub_venue as hub, dbt_sivaprasanthmasilamani.sat_venue as sat
 WHERE hub.venue_id = sat.venue_id

 /*

 and sat.load_date =
       (
        SELECT
         MAX(s2.load_date)
        FROM
         dbt_sivaprasanthmasilamani.sat_venue s2
        WHERE hub.user_id = sat.user_id
       )
*/