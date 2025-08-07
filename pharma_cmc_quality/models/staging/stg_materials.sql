
-- This model performs basic cleaning and renaming of the raw materials table.
with source as (

    select * from {{ source('raw_quality_system', 'materials') }}

),

renamed as (

    select
        -- Primary Key
        material_id,

        -- Attributes
        material_name,
        material_type,
        supplier_id,

        -- Timestamps
        created_at as created_at_utc,
        updated_at as updated_at_utc

    from source

)

select * from renamed;