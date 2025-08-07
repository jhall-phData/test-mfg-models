SELECT
    b.batch_id,
    b.product_id,
    b.start_time,
    b.end_time,
    b.status,
    b.quantity_produced,
    e.equipment_id,
    e.equipment_name,
    e.equipment_type,
    r.recipe_id,
    r.recipe_name,
    r.version,
    w.work_order_id,
    w.schedule_start,
    w.schedule_end
FROM
    {{ ref('stg_batch_records') }} AS b
JOIN
    {{ ref('stg_equipment') }} AS e ON b.equipment_id = e.equipment_id
JOIN
    {{ ref('stg_recipes') }} AS r ON b.recipe_id = r.recipe_id
JOIN
    {{ ref('stg_work_orders') }} AS w ON b.work_order_id = w.work_order_id
WHERE
    b.status IN ('Completed', 'In Progress')