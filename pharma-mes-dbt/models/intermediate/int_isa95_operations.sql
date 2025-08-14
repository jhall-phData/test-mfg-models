SELECT
    o.operation_id,
    o.operation_name,
    o.start_time,
    o.end_time,
    o.status,
    o.batch_id,
    b.batch_number,
    b.product_id,
    p.product_name,
    e.equipment_id,
    e.equipment_name,
    e.equipment_status
FROM
    {{ ref('stg_batch_records') }} AS b
JOIN
    {{ ref('stg_equipment_status') }} AS e ON b.batch_id = e.batch_id
JOIN
    {{ ref('stg_quality_tests') }} AS q ON b.batch_id = q.batch_id
JOIN
    {{ ref('stg_material_lots') }} AS m ON b.batch_id = m.batch_id
JOIN
    operations AS o ON b.batch_id = o.batch_id
JOIN
    products AS p ON b.product_id = p.product_id
WHERE
    o.status IN ('In Progress', 'Completed')
ORDER BY
    o.start_time;