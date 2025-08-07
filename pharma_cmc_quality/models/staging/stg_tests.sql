-- This model performs basic cleaning and renaming of the raw tests table.
with source as (

    select * from {{ source('raw_quality_system', 'tests') }}

),

renamed as (

    select
        -- Primary Key
        test_id,

        -- Attributes
        test_name,
        test_method_document,

        -- Timestamps
        created_at as created_at_utc

    from source

)

select * from renamed;