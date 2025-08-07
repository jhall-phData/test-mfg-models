SELECT
    equipment_id,
    equipment_name,
    equipment_type,
    status,
    last_maintenance_date,
    created_at,
    updated_at
FROM
    {{ ref('equipment_master') }}