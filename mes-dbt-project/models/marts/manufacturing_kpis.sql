SELECT
    SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS total_completed_batches,
    SUM(CASE WHEN status = 'In Progress' THEN 1 ELSE 0 END) AS total_in_progress_batches,
    AVG(CASE WHEN status = 'Completed' THEN duration END) AS average_batch_duration,
    COUNT(DISTINCT equipment_id) AS total_equipment_used,
    SUM(CASE WHEN status = 'Completed' THEN quantity ELSE 0 END) AS total_quantity_produced,
    SUM(CASE WHEN status = 'Completed' THEN waste ELSE 0 END) AS total_waste_generated
FROM
    {{ ref('stg_batches') }} AS batches
JOIN
    {{ ref('stg_equipment') }} AS equipment ON batches.equipment_id = equipment.id
WHERE
    batches.created_at >= DATE_TRUNC('month', CURRENT_DATE) 
    AND batches.created_at < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' 
GROUP BY
    DATE_TRUNC('day', batches.created_at) 
ORDER BY
    DATE_TRUNC('day', batches.created_at);