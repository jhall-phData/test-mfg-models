SELECT
    equipment_id,
    log_timestamp,
    log_type,
    log_message,
    CASE
        WHEN log_type = 'START' THEN 'Started'
        WHEN log_type = 'STOP' THEN 'Stopped'
        WHEN log_type = 'ERROR' THEN 'Error'
        ELSE 'Other'
    END AS log_status
FROM
    {{ ref('raw_equipment_logs') }}
WHERE
    log_timestamp >= CURRENT_DATE - INTERVAL '30 days'
ORDER BY
    log_timestamp DESC;