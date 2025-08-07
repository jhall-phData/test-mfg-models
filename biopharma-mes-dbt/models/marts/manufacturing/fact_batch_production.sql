SELECT
    b.batch_id,
    b.product_id,
    b.start_time,
    b.end_time,
    b.quantity_produced,
    b.quantity_scrap,
    b.equipment_id,
    e.equipment_name,
    p.product_name,
    p.product_specification,
    b.production_shift,
    b.operator_id,
    b.batch_status,
    b.created_at,
    b.updated_at
FROM
    {{ ref('stg_batch_records') }} AS b
JOIN
    {{ ref('dim_products') }} AS p ON b.product_id = p.product_id
JOIN
    {{ ref('dim_equipment') }} AS e ON b.equipment_id = e.equipment_id
WHERE
    b.batch_status IN ('Completed', 'In Progress')
ORDER BY
    b.start_time DESC;