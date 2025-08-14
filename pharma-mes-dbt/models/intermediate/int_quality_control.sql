SELECT
    qc.batch_id,
    qc.test_id,
    qc.test_result,
    qc.test_date,
    qc.test_status,
    qc.material_lot_id,
    qc.equipment_id,
    qc.operator_id,
    qc.quality_specification_id,
    CASE
        WHEN qc.test_status = 'Passed' THEN 'Pass'
        WHEN qc.test_status = 'Failed' THEN 'Fail'
        ELSE 'Unknown'
    END AS result_status,
    ROW_NUMBER() OVER (PARTITION BY qc.batch_id ORDER BY qc.test_date DESC) AS test_sequence
FROM
    {{ ref('stg_quality_tests') }} AS qc
JOIN
    {{ ref('stg_batch_records') }} AS br ON qc.batch_id = br.batch_id
JOIN
    {{ ref('stg_material_lots') }} AS ml ON qc.material_lot_id = ml.material_lot_id
JOIN
    {{ ref('stg_equipment_status') }} AS es ON qc.equipment_id = es.equipment_id
WHERE
    qc.test_date >= CURRENT_DATE - INTERVAL '30 days'
ORDER BY
    qc.batch_id, qc.test_date DESC;