{{
    config(
        materialized='view',
    )
}}
--Issue Types Distribution
SELECT issue_type,
       COUNT(*) AS count
FROM {{ ref('stg_issues') }}
GROUP BY issue_type
