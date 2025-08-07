SELECT
    operation_id,
    procedure_id,
    unit_procedure_id,
    phase_id,
    operation_name,
    operation_description,
    start_time,
    end_time,
    status
FROM
    {{ ref('stg_procedures') }} AS procedures
JOIN
    {{ ref('stg_batches') }} AS batches
ON
    procedures.batch_id = batches.batch_id
JOIN
    {{ ref('stg_equipment') }} AS equipment
ON
    procedures.equipment_id = equipment.equipment_id
WHERE
    procedures.status = 'active';