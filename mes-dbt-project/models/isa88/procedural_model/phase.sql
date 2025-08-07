SELECT
    phase_id,
    phase_name,
    procedure_id,
    unit_procedure_id,
    operation_id,
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
    batches.equipment_id = equipment.equipment_id
WHERE
    status IN ('active', 'completed')
ORDER BY
    start_time;