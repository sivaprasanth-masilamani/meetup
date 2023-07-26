-- To add: meta data: load date and source

{{ config(materialized='table') }}

SELECT  hub.user_id,
        country,
        city,
        hometown
 FROM dbt_sivaprasanthmasilamani.hub_users as hub, dbt_sivaprasanthmasilamani.sat_users as sat
 WHERE hub.user_id = sat.user_id

 /*

 and sat.load_date =
       (
        SELECT
         MAX(s2.load_date)
        FROM
         dbt_sivaprasanthmasilamani.sat_users s2
        WHERE hub.user_id = sat.user_id
       )

*/