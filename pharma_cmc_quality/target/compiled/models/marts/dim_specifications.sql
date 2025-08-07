-- This model creates a comprehensive specification dimension,
-- joining tests and their criteria.
with specs as (
    select * from JHALL_SANDBOX.RAW_pqcmc_staging.stg_specifications
),
spec_tests as (
    select * from JHALL_SANDBOX.RAW_pqcmc_staging.stg_specification_tests
),
tests as (
    select * from JHALL_SANDBOX.RAW_pqcmc_staging.stg_tests
)

select
    st.spec_test_id,
    s.spec_id,
    s.spec_for_id,
    s.spec_version,
    s.effective_date,
    t.test_id,
    t.test_name,
    st.acceptance_criteria
from spec_tests st
left join specs s on st.spec_id = s.spec_id
left join tests t on st.test_id = t.test_id;