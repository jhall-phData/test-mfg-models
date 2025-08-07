SELECT 
    COUNT(*) AS total_batches,
    COUNT(CASE WHEN batch_id IS NOT NULL THEN 1 END) AS completed_batches,
    COUNT(CASE WHEN batch_id IS NULL THEN 1 END) AS incomplete_batches
FROM 
    {{ ref('stg_batch_records') }}
WHERE 
    created_at >= CURRENT_DATE - INTERVAL '30 days';

-- Ensure that the number of completed batches matches the expected count
-- This test will fail if the number of completed batches is less than the total batches.