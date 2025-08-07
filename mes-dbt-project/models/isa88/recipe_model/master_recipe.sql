-- This model defines master recipes in the ISA-88 framework.
WITH master_recipes AS (
    SELECT
        recipe_id,
        recipe_name,
        recipe_description,
        created_at,
        updated_at
    FROM {{ ref('general_recipe') }}
    WHERE recipe_type = 'Master'
),

recipe_details AS (
    SELECT
        mr.recipe_id,
        mr.recipe_name,
        mr.recipe_description,
        r.step_number,
        r.step_description,
        r.step_duration
    FROM master_recipes mr
    JOIN {{ ref('site_recipe') }} r ON mr.recipe_id = r.recipe_id
)

SELECT
    recipe_id,
    recipe_name,
    recipe_description,
    ARRAY_AGG(STRUCT(step_number, step_description, step_duration)) AS steps
FROM recipe_details
GROUP BY recipe_id, recipe_name, recipe_description;