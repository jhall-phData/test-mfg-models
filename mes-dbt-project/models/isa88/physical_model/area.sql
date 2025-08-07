SELECT
    area_id,
    area_name,
    site_id,
    enterprise_id,
    created_at,
    updated_at
FROM
    {{ ref('stg_areas') }}