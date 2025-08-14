SELECT
    equipment_id,
    SUM(run_time) AS total_run_time,
    SUM(downtime) AS total_downtime,
    (SUM(run_time) / NULLIF(SUM(run_time) + SUM(downtime), 0)) * 100 AS efficiency_percentage
FROM
    {{ ref('stg_equipment_status') }}
GROUP BY
    equipment_id
ORDER BY
    efficiency_percentage DESC;