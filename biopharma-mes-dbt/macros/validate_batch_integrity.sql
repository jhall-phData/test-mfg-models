SELECT
    batch_id,
    COUNT(*) AS record_count,
    SUM(CASE WHEN field_name IS NULL OR field_name = '' THEN 1 ELSE 0 END) AS missing_fields
FROM
    {{ ref('stg_batch_records') }}
GROUP BY
    batch_id
HAVING
    missing_fields > 0;