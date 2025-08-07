
-- This model performs basic cleaning and renaming of the raw lots table.
with source as (

    select * from {{ source('raw_quality_system', 'lots') }}

),

renamed as (

    select
        -- Primary Key
        lot_id,

        -- Foreign Keys
        product_id,
        material_id,

        -- Attributes
        lot_number,
        status as lot_status,

        -- Timestamps
        manufacture_date,
        expiry_date,
        created_at as created_at_utc

    from source

)

select * from renamed;