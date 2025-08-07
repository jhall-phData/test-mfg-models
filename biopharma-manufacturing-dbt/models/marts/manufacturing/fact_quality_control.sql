SELECT
    qc.batch_id,
    qc.sample_id,
    qc.test_type,
    qc.test_result,
    qc.test_date,
    qc.tested_by,
    qc.compliance_status,
    qc.comments,
    b.product_id,
    b.production_date,
    e.equipment_id,
    e.equipment_name
FROM
    {{ ref('stg_quality_control') }} AS qc
JOIN
    {{ ref('stg_batch_records') }} AS b ON qc.batch_id = b.batch_id
JOIN
    {{ ref('stg_equipment') }} AS e ON qc.equipment_id = e.equipment_id
WHERE
    qc.test_date >= CURRENT_DATE - INTERVAL '30 days'