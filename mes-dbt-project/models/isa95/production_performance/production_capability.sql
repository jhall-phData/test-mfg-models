SELECT
    production_line_id,
    SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed_jobs,
    SUM(CASE WHEN status = 'In Progress' THEN 1 ELSE 0 END) AS in_progress_jobs,
    SUM(CASE WHEN status = 'Failed' THEN 1 ELSE 0 END) AS failed_jobs,
    COUNT(*) AS total_jobs,
    (SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100 AS completion_rate
FROM
    {{ ref('production_performance') }}
GROUP BY
    production_line_id;