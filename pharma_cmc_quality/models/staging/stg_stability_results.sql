-- This model cleans the raw stability results data.
with source as (

    select * from {{ source('raw_quality_system', 'stability_results') }}

),

renamed as (

    select
        -- Primary Key
        stability_result_id,
        -- Foreign Keys
        study_id,
        lot_id,
        test_id,
        -- Attributes
        storage_condition,
        timepoint,
        result_value,
        -- Timestamps
        pull_date,
        tested_at as tested_at_utc

    from source

)

select * from renamed;