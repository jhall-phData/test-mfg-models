SELECT
    pc.process_cell_id,
    pc.process_cell_name,
    pc.description,
    pc.status,
    pc.equipment_module_id,
    em.equipment_module_name,
    em.equipment_module_type
FROM
    {{ ref('stg_batch_records') }} AS br
JOIN
    {{ ref('stg_equipment') }} AS eq ON br.equipment_id = eq.equipment_id
JOIN
    {{ ref('stg_recipes') }} AS r ON br.recipe_id = r.recipe_id
JOIN
    {{ ref('stg_work_orders') }} AS wo ON br.work_order_id = wo.work_order_id
JOIN
    process_cells AS pc ON eq.process_cell_id = pc.process_cell_id
JOIN
    equipment_modules AS em ON pc.equipment_module_id = em.equipment_module_id
WHERE
    pc.status = 'Active';