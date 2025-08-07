SELECT
    batch_id,
    product_id,
    start_time,
    end_time,
    status,
    quantity_produced,
    quantity_scrap,
    operator_id,
    equipment_id,
    created_at,
    updated_at
FROM
    raw.batch_records
WHERE
    status IN ('Completed', 'In Progress')
ORDER BY
    start_time DESC;