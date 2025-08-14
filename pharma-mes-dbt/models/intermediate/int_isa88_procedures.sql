SELECT
    procedure_id,
    procedure_name,
    procedure_type,
    start_time,
    end_time,
    status,
    equipment_id,
    material_id,
    batch_id
FROM
    {{ ref('stg_batch_records') }} AS batch
JOIN
    {{ ref('stg_equipment_status') }} AS equipment
    ON batch.equipment_id = equipment.equipment_id
JOIN
    {{ ref('stg_material_lots') }} AS material
    ON batch.material_id = material.material_id
WHERE
    procedure_type IN ('Continuous', 'Batch')
    AND status IN ('In Progress', 'Completed')
ORDER BY
    start_time;