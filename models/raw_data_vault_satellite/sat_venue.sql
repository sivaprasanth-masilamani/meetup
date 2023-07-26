{{ config(materialized='table') }}

SELECT  venue_id,                   
        name,           
        city,                   
        country,        
        lat,
        lon,
        CURRENT_DATE() AS load_date
 FROM raw.venues as venues