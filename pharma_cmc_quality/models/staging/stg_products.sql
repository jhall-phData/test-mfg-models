
-- This model performs basic cleaning and renaming of the raw products table.
with source as (

    select * from {{ source('raw_quality_system', 'products') }}

),

renamed as (

    select
        -- Primary Key
        product_id,

        -- Attributes
        product_name,
        dosage_form,
        strength,

        -- Timestamps
        created_at as created_at_utc,
        updated_at as updated_at_utc

    from source

)

select * from renamed;