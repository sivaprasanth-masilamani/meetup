-- To add: meta data: load date and source

{{ config(materialized='table') }}

SELECT   link1.event_id
        ,link2.user_id
        ,link3.group_id
        ,sat1.converted_when
        ,sum(sat1.guests) as sum_of_guests
        ,sum(case when sat1.response = 'yes' then 1 else 0 end) as count_of_yes 
        ,sum(case when sat1.response = 'yes' then 0 else 1 end) as count_of_no 
 FROM dbt_sivaprasanthmasilamani.link_event_group as link1
 LEFT JOIN dbt_sivaprasanthmasilamani.link_event_user link2
    ON link1.event_id = link2.event_id
 LEFT JOIN dbt_sivaprasanthmasilamani.sat_event_user sat1
    ON link2.event_id = sat1.event_id
    AND link2.user_id = sat1.user_id
 LEFT JOIN dbt_sivaprasanthmasilamani.link_user_group link3
    ON link2.user_id = link3.user_id
 GROUP BY link1.event_id
          ,link2.user_id
          ,link3.group_id
          ,sat1.converted_when
 /*
 and sat.load_date =
       (
        SELECT
         MAX(s2.load_date)
        FROM
         dbt_sivaprasanthmasilamani.sat_events s2
        WHERE s2.event_id = hub.event_id
       )
*/