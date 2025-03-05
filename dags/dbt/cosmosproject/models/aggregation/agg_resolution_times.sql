{{
    config(
        materialized='view',
    )
}}
--Resolution Times
SELECT created_by,
       created_date,
       end_date,
       (end_date - created_date) AS resolution_time_in_days
FROM {{ ref('stg_issues') }}
WHERE end_date IS NOT NULL
