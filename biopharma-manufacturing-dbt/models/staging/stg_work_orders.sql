SELECT
    work_order_id,
    product_id,
    batch_id,
    start_time,
    end_time,
    status,
    created_at,
    updated_at
FROM
    raw.work_orders
WHERE
    status IN ('Scheduled', 'In Progress', 'Completed');