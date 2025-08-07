SELECT
    wr.id AS work_response_id,
    wr.work_order_id,
    wr.response_time,
    wr.status,
    wr.comments,
    wo.product_id,
    wo.quantity AS work_order_quantity,
    wo.start_time AS work_order_start_time,
    wo.end_time AS work_order_end_time
FROM
    {{ ref('work_order') }} AS wo
JOIN
    {{ ref('work_response') }} AS wr ON wo.id = wr.work_order_id
WHERE
    wr.response_time IS NOT NULL;