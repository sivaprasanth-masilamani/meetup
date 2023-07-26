{{ config(materialized='table') }}

SELECT  user_id,
        memberships.group_id,
        memberships.joined,
        DATE(TIMESTAMP_MILLIS(memberships.joined)) AS converted_joined,
        CURRENT_DATE() AS load_date
 FROM raw.users as users, UNNEST(memberships) as memberships