{{ config(materialized='table') }}

SELECT  user_id,
        memberships.group_id
 FROM raw.users as users, UNNEST(memberships) as memberships