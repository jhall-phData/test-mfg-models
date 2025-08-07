SELECT
    batch_id,
    COUNT(*) AS record_count,
    COUNT(DISTINCT equipment_id) AS unique_equipment_count,
    COUNT(DISTINCT recipe_id) AS unique_recipe_count,
    MIN(start_time) AS first_record_time,
    MAX(end_time) AS last_record_time
FROM {{ ref('stg_batch_records') }}
GROUP BY batch_id
HAVING COUNT(*) > 0;