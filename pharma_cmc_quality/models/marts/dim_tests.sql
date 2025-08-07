-- This model creates the dimension table for tests.
select
    test_id,
    test_name,
    test_method_document
from {{ ref('stg_tests') }};