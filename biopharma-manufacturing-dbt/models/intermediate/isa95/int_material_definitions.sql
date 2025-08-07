SELECT
    material_id AS material_id,
    material_name AS material_name,
    material_type AS material_type,
    classification AS classification,
    specifications AS specifications,
    supplier AS supplier,
    created_at AS created_at,
    updated_at AS updated_at
FROM
    {{ ref('stg_materials') }}
WHERE
    material_type IN ('Raw Material', 'Intermediate', 'Finished Goods');