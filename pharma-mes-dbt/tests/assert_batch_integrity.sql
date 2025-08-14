SELECT 
    batch_id,
    COUNT(*) AS record_count,
    COUNT(DISTINCT material_lot_id) AS unique_material_lots,
    COUNT(DISTINCT equipment_id) AS unique_equipment,
    MIN(created_at) AS first_record_time,
    MAX(created_at) AS last_record_time
FROM 
    {{ ref('stg_batch_records') }}
GROUP BY 
    batch_id
HAVING 
    record_count > 0
    AND unique_material_lots > 0
    AND unique_equipment > 0;