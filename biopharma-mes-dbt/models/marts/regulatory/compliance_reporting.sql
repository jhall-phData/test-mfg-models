SELECT
    b.batch_id,
    b.product_id,
    b.start_time,
    b.end_time,
    b.status,
    b.quantity_produced,
    q.test_result,
    e.equipment_id,
    e.equipment_name,
    e.equipment_type,
    CASE
        WHEN b.status = 'Completed' AND q.test_result = 'Pass' THEN 'Compliant'
        WHEN b.status = 'Completed' AND q.test_result = 'Fail' THEN 'Non-Compliant'
        ELSE 'Pending'
    END AS compliance_status
FROM
    {{ ref('stg_batch_records') }} AS b
JOIN
    {{ ref('stg_quality_tests') }} AS q ON b.batch_id = q.batch_id
JOIN
    {{ ref('stg_equipment_logs') }} AS e ON b.equipment_id = e.equipment_id
WHERE
    b.start_time >= CURRENT_DATE - INTERVAL '1 year'
ORDER BY
    b.start_time DESC;