-- This model creates the fact table for stability results.
with stability_studies as (
    select * from JHALL_SANDBOX.RAW_pqcmc_staging.stg_stability_studies
),
stability_results as (
    select * from JHALL_SANDBOX.RAW_pqcmc_staging.stg_stability_results
)

select
    -- Primary Key
    sr.stability_result_id,

    -- Foreign Keys
    sr.study_id,
    sr.lot_id,
    sr.test_id,
    ss.product_id,

    -- Measures
    sr.result_value,
    
    -- Degenerate Dimensions
    sr.storage_condition,
    sr.timepoint,
    
    -- Timestamps
    sr.pull_date,
    sr.tested_at_utc,
    ss.study_start_date
    
from stability_results sr
left join stability_studies ss on sr.study_id = ss.study_id;