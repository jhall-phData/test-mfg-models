SELECT
    r.recipe_id,
    r.recipe_name,
    r.version,
    r.created_at,
    r.updated_at,
    r.site_id,
    r.description,
    r.ingredients,
    r.instructions
FROM
    {{ ref('general_recipe') }} r
WHERE
    r.site_id = {{ var('site_id') }};