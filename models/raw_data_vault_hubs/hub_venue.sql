{{ config(materialized='table') }}

SELECT  venue_id
        ,CURRENT_DATE() AS load_date
 FROM raw.venues as venues