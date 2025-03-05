{{
    config(
        materialized='table',
    )
}}
SELECT 
		created_by,
		created_by_id,
		created_by_team,
		created_by_management_level,
		severity,
		issue_type,
		issue_status,
		TO_DATE(created_date, 'YYYY-MM-DD') AS created_date,
		TO_DATE(moved_to_in_progress, 'YYYY-MM-DD') AS moved_to_in_progress,
		TO_DATE(end_date, 'YYYY-MM-DD') AS end_date
FROM
    {{ source('raw_data', 'issues_data') }}