  {{ config(materialized='table') }}
  
  with scheduling_rank as (
      SELECT venue_id,
            EXTRACT(MONTH FROM converted_time) AS month,
            EXTRACT(WEEK FROM converted_time) + 1 AS week_number,
            EXTRACT(DAY FROM converted_time) AS day,
            FORMAT_DATE('%A', converted_time) AS day_in_words,
            converted_time as time_of_event,
            sum(case when sat2.response = 'yes' then 1 else 0 end) as count_of_yes,
            sum(case when sat2.response = 'yes' then 0 else 1 end) as count_of_no,
            sum(case when sat2.response = 'yes' then 1 else 0 end) + sum(sat2.guests) as total_attendance
      FROM `meetup-393712.dbt_sivaprasanthmasilamani.sat_events` sat1
      left join `meetup-393712.dbt_sivaprasanthmasilamani.sat_event_user` sat2
      on sat1.event_id = sat2.event_id
      group by venue_id,
            converted_time
  )
  select
      venue_id
      ,month
      ,week_number
      ,day_in_words
      ,time_of_event
      ,RANK() OVER (PARTITION BY month ORDER BY total_attendance DESC) AS rank
  from scheduling_rank
  order by month, rank

