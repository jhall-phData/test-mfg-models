-- This model cleans the raw stability studies data.
with source as (

    select * from JHALL_SANDBOX.PQCMC_RAW.stability_studies

),

renamed as (

    select
        -- Primary Key
        study_id,
        -- Foreign Key
        product_id,
        -- Attributes
        protocol_number, 
        -- Timestamps
        start_date as study_start_date,
        created_at as created_at_utc

    from source

)

select * from renamed;