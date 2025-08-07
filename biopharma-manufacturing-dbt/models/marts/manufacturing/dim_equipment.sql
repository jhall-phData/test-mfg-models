SELECT
    equipment_id,
    equipment_name,
    equipment_type,
    manufacturer,
    model_number,
    serial_number,
    operational_status,
    installation_date,
    last_maintenance_date,
    capacity,
    unit_of_measure,
    created_at,
    updated_at
FROM
    {{ ref('stg_equipment') }}