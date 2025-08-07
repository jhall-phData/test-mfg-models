-- This model creates the dimension table for products.
select
    product_id,
    product_name,
    dosage_form,
    strength
from {{ ref('stg_products') }};