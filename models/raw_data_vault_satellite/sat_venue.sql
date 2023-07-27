{{ config(materialized='table') }}

SELECT  cast(venue_id as int64) as venue_id,                  
        name,           
        city,                   
        country,        
        lat,
        lon,
        CURRENT_DATE() AS load_date
 FROM raw.venues as venues