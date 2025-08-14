SELECT
    b.batch_id,
    b.product_name,
    b.start_time,
    b.end_time,
    b.status,
    q.test_name,
    q.test_result,
    q.test_date,
    m.material_name,
    m.lot_number,
    m.quantity_used
FROM
    {{ ref('stg_batch_records') }} AS b
JOIN
    {{ ref('stg_quality_tests') }} AS q ON b.batch_id = q.batch_id
JOIN
    {{ ref('stg_material_lots') }} AS m ON b.batch_id = m.batch_id
WHERE
    b.status = 'Completed'
    AND q.test_result = 'Pass'
ORDER BY
    b.start_time DESC;