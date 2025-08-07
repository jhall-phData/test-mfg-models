SELECT
    unit_procedure_id,
    unit_procedure_name,
    procedure_id,
    description,
    created_at,
    updated_at
FROM
    {{ ref('procedure') }}
WHERE
    unit_procedure_id IS NOT NULL;