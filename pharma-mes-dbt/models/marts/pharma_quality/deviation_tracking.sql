SELECT
    deviation_id,
    batch_id,
    deviation_type,
    deviation_description,
    occurred_at,
    resolved_at,
    resolution_description,
    status,
    created_at,
    updated_at
FROM
    {{ ref('stg_quality_tests') }}
WHERE
    status = 'Open'
ORDER BY
    occurred_at DESC;