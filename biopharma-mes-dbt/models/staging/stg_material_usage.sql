SELECT
    mu.batch_id,
    mu.material_id,
    mu.quantity_used,
    mu.unit_of_measure,
    mu.timestamp,
    b.product_id,
    b.batch_status
FROM
    raw.material_usage mu
JOIN
    raw.batch_records b ON mu.batch_id = b.batch_id
WHERE
    b.batch_status IN ('Completed', 'In Progress')
ORDER BY
    mu.timestamp;