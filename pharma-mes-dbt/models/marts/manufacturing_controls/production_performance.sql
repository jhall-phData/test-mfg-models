SELECT
    production_run_id,
    batch_id,
    start_time,
    end_time,
    total_yield,
    total_scrap,
    efficiency,
    quality_score
FROM
    {{ ref('stg_batch_records') }} AS batch
JOIN
    {{ ref('stg_equipment_status') }} AS equipment
ON
    batch.equipment_id = equipment.equipment_id
JOIN
    {{ ref('stg_quality_tests') }} AS quality
ON
    batch.batch_id = quality.batch_id
WHERE
    batch.start_time >= DATEADD(day, -30, CURRENT_DATE)
ORDER BY
    start_time DESC;