{{ config(materialized='table') }}

SELECT  user_id
        ,CURRENT_DATE() AS load_date
 FROM raw.users as users