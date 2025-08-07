-- This model cleans the junction table for stability studies and lots.
with source as (

    select * from JHALL_SANDBOX.PQCMC_RAW.stability_lots

),

renamed as (

    select
        -- Foreign Keys
        study_id,
        lot_id,
        -- Timestamps
        added_at as added_to_study_at_utc

    from source

)

select * from renamed;