-- This model creates the dimension table for lots.
select
    lot_id,
    lot_number,
    product_id,
    material_id,
    manufacture_date,
    expiry_date,
    lot_status
from JHALL_SANDBOX.RAW_pqcmc_staging.stg_lots;