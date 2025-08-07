SELECT
    b.batch_id,
    b.batch_name,
    b.start_time,
    b.end_time,
    e.equipment_id,
    e.equipment_name,
    p.procedure_id,
    p.procedure_name,
    r.recipe_id,
    r.recipe_name,
    ARRAY_AGG(DISTINCT o.operation_id) AS operations,
    ARRAY_AGG(DISTINCT ph.phase_id) AS phases
FROM
    {{ ref('stg_batches') }} AS b
JOIN
    {{ ref('stg_equipment') }} AS e ON b.equipment_id = e.equipment_id
JOIN
    {{ ref('stg_procedures') }} AS p ON b.procedure_id = p.procedure_id
JOIN
    {{ ref('isa88.recipe_model.master_recipe') }} AS r ON b.recipe_id = r.recipe_id
LEFT JOIN
    {{ ref('isa88.procedural_model.operation') }} AS o ON b.batch_id = o.batch_id
LEFT JOIN
    {{ ref('isa88.procedural_model.phase') }} AS ph ON o.operation_id = ph.operation_id
GROUP BY
    b.batch_id, b.batch_name, b.start_time, b.end_time, e.equipment_id, e.equipment_name, p.procedure_id, p.procedure_name, r.recipe_id, r.recipe_name
ORDER BY
    b.start_time;