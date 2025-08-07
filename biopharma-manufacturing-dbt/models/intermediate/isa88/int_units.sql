SELECT
    unit_id,
    unit_name,
    unit_type,
    operational_status,
    created_at,
    updated_at
FROM
    {{ ref('stg_equipment') }} AS equipment
JOIN
    {{ ref('stg_recipes') }} AS recipes
ON
    equipment.recipe_id = recipes.recipe_id
WHERE
    equipment.operational_status = 'Active';