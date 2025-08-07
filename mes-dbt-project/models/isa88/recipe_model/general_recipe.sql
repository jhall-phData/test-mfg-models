-- This model defines general recipes in the ISA-88 framework.
WITH recipe_data AS (
    SELECT
        recipe_id,
        recipe_name,
        recipe_description,
        created_at,
        updated_at
    FROM
        {{ ref('stg_batches') }}  -- Reference to the staging model for batches
    WHERE
        recipe_type = 'General'
)

SELECT
    recipe_id,
    recipe_name,
    recipe_description,
    created_at,
    updated_at
FROM
    recipe_data;