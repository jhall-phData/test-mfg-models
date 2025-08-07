SELECT
    equipment_id,
    equipment_name,
    equipment_type,
    manufacturer,
    model_number,
    serial_number,
    installation_date,
    last_maintenance_date,
    operational_status,
    capacity,
    location,
    created_at,
    updated_at
FROM
    {{ ref('stg_equipment_logs') }}