SELECT
    qt.test_id,
    qt.batch_id,
    qt.test_date,
    qt.test_result,
    qt.specification_id,
    qt.test_method,
    qt.analyst_id,
    qt.comments,
    m.material_id,
    m.material_name,
    b.batch_status
FROM
    raw.quality_tests qt
JOIN
    raw.materials m ON qt.material_id = m.material_id
JOIN
    raw.batch_records b ON qt.batch_id = b.batch_id
WHERE
    qt.test_date >= CURRENT_DATE - INTERVAL '30 days'
    AND b.batch_status IN ('Completed', 'In Progress')
ORDER BY
    qt.test_date DESC;