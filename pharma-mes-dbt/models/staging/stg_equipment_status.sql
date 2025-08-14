SELECT
    equipment_id,
    equipment_name,
    equipment_type,
    status,
    last_updated
FROM
    raw.equipment_status
WHERE
    status IN ('Operational', 'Non-Operational', 'Maintenance')
ORDER BY
    last_updated DESC;