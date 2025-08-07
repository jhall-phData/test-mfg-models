SELECT
    batch_id,
    product_id,
    start_time,
    end_time,
    quantity,
    status
FROM
    raw_batches
WHERE
    status IN ('Completed', 'In Progress');