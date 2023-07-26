{{ config(materialized='table') }}

SELECT  user_id,
        country,
        city,
        hometown,
        CURRENT_DATE() AS load_date
 FROM raw.users as users