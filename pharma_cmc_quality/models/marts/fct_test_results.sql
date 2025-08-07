-- This model creates the fact table for lot test results.
select
    -- Primary Key
    result_id,

    -- Foreign Keys
    lot_id,
    spec_test_id,

    -- Measures
    result_value,
    
    -- Degenerate Dimension
    result_status,
    
    -- Timestamps
    tested_at_utc
from {{ ref('stg_test_results') }};