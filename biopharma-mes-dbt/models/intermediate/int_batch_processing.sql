SELECT
    batch_id,
    COUNT(*) AS total_batches,
    AVG(batch_yield) AS average_yield,
    SUM(material_used) AS total_material_used,
    SUM(CASE WHEN quality_passed THEN 1 ELSE 0 END) AS total_quality_passed,
    SUM(CASE WHEN quality_passed THEN 0 ELSE 1 END) AS total_quality_failed
FROM
    {{ ref('stg_batch_records') }} AS batch_records
JOIN
    {{ ref('stg_material_usage') }} AS material_usage ON batch_records.batch_id = material_usage.batch_id
JOIN
    {{ ref('stg_quality_tests') }} AS quality_tests ON batch_records.batch_id = quality_tests.batch_id
GROUP BY
    batch_id
ORDER BY
    batch_id;