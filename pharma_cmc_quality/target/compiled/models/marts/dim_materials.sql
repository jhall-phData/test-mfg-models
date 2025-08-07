-- This model creates the dimension table for materials.
select
    material_id,
    material_name,
    material_type,
    supplier_id
from JHALL_SANDBOX.RAW_pqcmc_staging.stg_materials;