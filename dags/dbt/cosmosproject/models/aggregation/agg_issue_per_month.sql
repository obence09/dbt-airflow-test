{{
    config(
        materialized='view',
    )
}}
--Issue per month
SELECT DATE(DATE_TRUNC('month', created_date)) AS year_month,
       COUNT(*) AS issue_count
FROM {{ ref('stg_issues') }}
GROUP BY year_month
ORDER BY year_month
