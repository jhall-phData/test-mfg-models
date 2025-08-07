-- This model creates the dimension table for products.
select
    product_id,
    product_name,
    dosage_form,
    strength
from JHALL_SANDBOX.RAW_pqcmc_staging.stg_products;