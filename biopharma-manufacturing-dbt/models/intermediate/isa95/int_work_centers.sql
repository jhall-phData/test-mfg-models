SELECT
    wc.work_center_id,
    wc.work_center_name,
    wc.description,
    wc.location,
    wc.capacity,
    wc.equipment_id,
    e.equipment_name,
    e.equipment_type,
    e.status
FROM
    {{ ref('stg_work_orders') }} AS wc
LEFT JOIN
    {{ ref('stg_equipment') }} AS e ON wc.equipment_id = e.equipment_id
WHERE
    wc.active = TRUE;