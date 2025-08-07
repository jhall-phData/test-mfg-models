
-- This model cleans the junction table between specifications and tests.
with source as (

    select * from {{ source('raw_quality_system', 'specification_tests') }}

),

renamed as (

    select
        -- Primary Key
        spec_test_id,
        -- Foreign Keys
        spec_id,
        test_id,
        -- Attributes
        acceptance_criteria,
        -- Timestamps
        created_at as created_at_utc

    from source

)

select * from renamed;
