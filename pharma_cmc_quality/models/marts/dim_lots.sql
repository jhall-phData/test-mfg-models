-- This model creates the dimension table for lots.
select
    lot_id,
    lot_number,
    product_id,
    material_id,
    manufacture_date,
    expiry_date,
    lot_status
from {{ ref('stg_lots') }};