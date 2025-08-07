SELECT
    e.equipment_id,
    e.equipment_name,
    SUM(CASE WHEN b.status = 'Running' THEN 1 ELSE 0 END) AS running_time,
    SUM(CASE WHEN b.status = 'Idle' THEN 1 ELSE 0 END) AS idle_time,
    SUM(CASE WHEN b.status = 'Down' THEN 1 ELSE 0 END) AS downtime,
    COUNT(b.batch_id) AS total_batches,
    (SUM(CASE WHEN b.status = 'Running' THEN 1 ELSE 0 END) * 1.0 / COUNT(b.batch_id)) * 100 AS utilization_rate
FROM
    {{ ref('stg_equipment') }} e
LEFT JOIN
    {{ ref('stg_batch_records') }} b ON e.equipment_id = b.equipment_id
GROUP BY
    e.equipment_id,
    e.equipment_name
ORDER BY
    utilization_rate DESC;