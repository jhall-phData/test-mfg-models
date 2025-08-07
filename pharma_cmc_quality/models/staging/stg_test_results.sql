-- This model cleans the raw test results data.
with source as (

    select * from {{ source('raw_quality_system', 'test_results') }}

),

renamed as (

    select
        -- Primary Key
        result_id,

        -- Foreign Keys
        lot_id,
        spec_test_id,

        -- Attributes
        result_value,
        result_status,

        -- Timestamps
        tested_at as tested_at_utc

    from source

)

select * from renamed;