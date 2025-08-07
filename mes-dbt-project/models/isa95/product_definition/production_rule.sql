SELECT
    production_rule_id,
    product_id,
    rule_description,
    created_at,
    updated_at
FROM
    {{ ref('product_definition') }}
WHERE
    is_active = TRUE;