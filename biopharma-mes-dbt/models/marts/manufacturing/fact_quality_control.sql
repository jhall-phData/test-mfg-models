SELECT
    b.batch_id,
    b.product_id,
    b.production_date,
    b.lot_number,
    qt.test_id,
    qt.test_date,
    qt.test_result,
    qt.test_criteria,
    CASE
        WHEN qt.test_result >= qt.test_criteria THEN 'Pass'
        ELSE 'Fail'
    END AS quality_status
FROM
    {{ ref('stg_batch_records') }} AS b
JOIN
    {{ ref('stg_quality_tests') }} AS qt ON b.batch_id = qt.batch_id
WHERE
    b.production_date >= DATEADD(year, -1, CURRENT_DATE)
ORDER BY
    b.production_date DESC;