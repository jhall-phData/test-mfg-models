SELECT
    b.batch_id,
    b.product_id,
    b.start_time,
    b.end_time,
    b.status,
    m.material_id,
    m.material_name,
    m.lot_number,
    q.test_id,
    q.test_result,
    q.test_date
FROM
    {{ ref('stg_batch_records') }} AS b
JOIN
    {{ ref('stg_material_lots') }} AS m ON b.batch_id = m.batch_id
JOIN
    {{ ref('stg_quality_tests') }} AS q ON b.batch_id = q.batch_id
ORDER BY
    b.start_time;