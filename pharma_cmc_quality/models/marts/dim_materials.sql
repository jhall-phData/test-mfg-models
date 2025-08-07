-- This model creates the dimension table for materials.
select
    material_id,
    material_name,
    material_type,
    supplier_id
from {{ ref('stg_materials') }};