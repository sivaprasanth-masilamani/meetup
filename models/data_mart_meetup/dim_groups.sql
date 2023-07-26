-- To add: meta data: load date and source

{{ config(materialized='table') }}

SELECT  hub.group_id,
        lat,                
        name,           
        description,            
        created,            
        link,           
        lon,                    
        city,           
        topics
 FROM dbt_sivaprasanthmasilamani.hub_groups as hub, dbt_sivaprasanthmasilamani.sat_groups as sat
 WHERE hub.group_id = sat.group_id
 
 /*
 and sat.load_date =
       (
        SELECT
         MAX(s2.load_date)
        FROM
         dbt_sivaprasanthmasilamani.sat_groups s2
        WHERE hub.group_id = sat.group_id
       )
*/