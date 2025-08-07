SELECT
    product_id,
    product_name,
    product_description,
    product_type,
    product_category,
    created_at,
    updated_at
FROM
    {{ ref('stg_products') }};