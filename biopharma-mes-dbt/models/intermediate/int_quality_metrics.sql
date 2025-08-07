SELECT
    batch_id,
    AVG(quality_score) AS average_quality_score,
    COUNT(*) AS total_quality_tests,
    SUM(CASE WHEN quality_score < passing_score THEN 1 ELSE 0 END) AS failed_tests
FROM
    {{ ref('stg_quality_tests') }}
GROUP BY
    batch_id;