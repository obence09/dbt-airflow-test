
SELECT
	created_by_id,
    COUNT(*) AS total_count
FROM {{ ref('stg_issues') }}
WHERE end_date < created_date
GROUP BY created_by_id
HAVING COUNT(*) < 0