{{ config(materialized='table') }}

SELECT  group_id,
        lat,                
        name,           
        description,            
        created,            
        link,           
        lon,                    
        city,           
        topics,
        DATE(TIMESTAMP_MILLIS(created)) AS converted_created,
        CURRENT_DATE() AS load_date
 FROM raw.groups as groupz