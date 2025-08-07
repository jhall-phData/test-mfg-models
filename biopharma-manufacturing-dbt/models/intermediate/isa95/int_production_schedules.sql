SELECT
    ps.schedule_id,
    ps.production_order_id,
    ps.start_time,
    ps.end_time,
    ps.resource_id,
    ps.status,
    ps.quantity,
    ps.material_id
FROM
    {{ ref('stg_work_orders') }} AS wo
JOIN
    {{ ref('stg_batch_records') }} AS br ON wo.work_order_id = br.work_order_id
JOIN
    {{ ref('stg_equipment') }} AS eq ON br.equipment_id = eq.equipment_id
JOIN
    {{ ref('stg_recipes') }} AS rc ON br.recipe_id = rc.recipe_id
JOIN
    production_schedules AS ps ON wo.production_order_id = ps.production_order_id
WHERE
    ps.status IN ('Scheduled', 'In Progress')
ORDER BY
    ps.start_time;