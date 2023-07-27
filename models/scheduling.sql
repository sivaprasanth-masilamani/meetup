  {{ config(materialized='table') }}
  
  with scheduling_rank as (
      SELECT sat1.venue_id,
            sat3.name,           
            sat3.city,                   
            sat3.country,   
            EXTRACT(YEAR FROM converted_time) AS year,
            EXTRACT(MONTH FROM converted_time) AS month,
            EXTRACT(WEEK FROM converted_time) + 1 AS week_number,
            EXTRACT(DAY FROM converted_time) AS day,
            FORMAT_DATE('%A', converted_time) AS day_in_words,
            converted_time as time_of_event,
            sum(case when sat2.response = 'yes' then 1 else 0 end) as count_of_yes,
            sum(case when sat2.response = 'yes' then 0 else 1 end) as count_of_no,
            sum(case when sat2.response = 'yes' then 1 else 0 end) + sum(sat2.guests) as total_attendance
      FROM `meetup-393712.data_vault.sat_events` sat1
      left join `meetup-393712.data_vault.sat_event_user` sat2
        on sat1.event_id = sat2.event_id
      left join `meetup-393712.data_vault.sat_venue` sat3
        on sat3.venue_id = sat1.venue_id
      group by venue_id,
            converted_time,
            sat3.name,           
            sat3.city,                   
            sat3.country
  ) 
  select
       year
      ,venue_id
      ,name          
      ,city                 
      ,country
      ,month
      ,week_number
      ,day_in_words
      ,time_of_event
      ,RANK() OVER (PARTITION BY month ORDER BY total_attendance DESC) AS rank
  from scheduling_rank
  order by month, rank

