SELECT 
    b.batch_id,
    b.product_id,
    b.start_time,
    b.end_time,
    b.status,
    b.quantity_produced,
    b.material_used,
    b.equipment_id,
    e.equipment_name,
    e.equipment_type,
    e.location,
    b.created_at,
    b.updated_at
FROM 
    {{ ref('stg_batch_records') }} AS b
JOIN 
    {{ ref('stg_equipment_logs') }} AS e
ON 
    b.equipment_id = e.equipment_id
WHERE 
    b.status IN ('Completed', 'In Progress')
ORDER BY 
    b.start_time DESC;