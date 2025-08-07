SELECT
    equipment_id,
    SUM(CASE WHEN status = 'running' THEN 1 ELSE 0 END) AS running_time,
    SUM(CASE WHEN status = 'idle' THEN 1 ELSE 0 END) AS idle_time,
    SUM(CASE WHEN status = 'down' THEN 1 ELSE 0 END) AS downtime,
    COUNT(*) AS total_time,
    (SUM(CASE WHEN status = 'running' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS utilization_rate
FROM
    {{ ref('stg_equipment_logs') }}
GROUP BY
    equipment_id;