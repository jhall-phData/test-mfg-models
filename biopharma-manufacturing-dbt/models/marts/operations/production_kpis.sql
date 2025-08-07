SELECT
    work_order_id,
    SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed_batches,
    SUM(CASE WHEN status = 'In Progress' THEN 1 ELSE 0 END) AS in_progress_batches,
    SUM(CASE WHEN status = 'Failed' THEN 1 ELSE 0 END) AS failed_batches,
    AVG(production_time) AS avg_production_time,
    COUNT(DISTINCT equipment_id) AS unique_equipment_used
FROM
    {{ ref('stg_work_orders') }} AS wo
JOIN
    {{ ref('stg_batch_records') }} AS br ON wo.work_order_id = br.work_order_id
GROUP BY
    work_order_id;