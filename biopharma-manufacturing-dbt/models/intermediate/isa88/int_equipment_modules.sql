SELECT
    em.equipment_module_id,
    em.name AS equipment_module_name,
    em.description,
    em.process_cell_id,
    pc.name AS process_cell_name,
    em.unit_id,
    u.name AS unit_name,
    em.status,
    em.created_at,
    em.updated_at
FROM
    {{ ref('stg_equipment') }} AS em
JOIN
    {{ ref('int_process_cells') }} AS pc ON em.process_cell_id = pc.process_cell_id
JOIN
    {{ ref('int_units') }} AS u ON em.unit_id = u.unit_id
WHERE
    em.status = 'active';