-- This model defines the procedures in the ISA-88 framework.
WITH procedures AS (
    SELECT
        procedure_id,
        procedure_name,
        description,
        created_at,
        updated_at
    FROM
        {{ ref('stg_procedures') }}
)

SELECT
    procedure_id,
    procedure_name,
    description,
    created_at,
    updated_at
FROM
    procedures
WHERE
    procedure_id IS NOT NULL;