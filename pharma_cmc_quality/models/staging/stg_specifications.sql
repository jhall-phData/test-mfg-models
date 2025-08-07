
-- This model performs basic cleaning and renaming of the raw specifications table.
with source as (

    select * from {{ source('raw_quality_system', 'specifications') }}

),

renamed as (

    select
        -- Primary Key
        spec_id,
        -- Foreign Keys
        spec_for_id, -- This could be a material_id or product_id
        -- Attributes
        version as spec_version,
        effective_date,

        -- Timestamps
        created_at as created_at_utc

    from source

)

select * from renamed;