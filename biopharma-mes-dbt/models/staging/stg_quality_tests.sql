SELECT
    test_id,
    batch_id,
    product_id,
    test_date,
    test_result,
    test_method,
    tester_id,
    created_at,
    updated_at
FROM
    raw_quality_tests
WHERE
    test_date >= '2023-01-01'  -- Filter for tests conducted in the current year
    AND test_result IS NOT NULL;  -- Exclude tests without results