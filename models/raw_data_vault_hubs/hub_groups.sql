{{ config(materialized='table') }}

SELECT   group_id
        ,CURRENT_DATE() AS load_date
 FROM raw.groups as groupz
