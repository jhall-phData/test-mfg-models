-- This model defines work orders in the ISA-95 framework.
WITH work_orders AS (
    SELECT
        wo.id AS work_order_id,
        wo.product_id,
        wo.quantity,
        wo.status,
        wo.start_time,
        wo.end_time,
        wo.created_at,
        wo.updated_at
    FROM
        {{ ref('stg_work_orders') }} AS wo
)

SELECT
    work_order_id,
    product_id,
    quantity,
    status,
    start_time,
    end_time,
    created_at,
    updated_at
FROM
    work_orders
WHERE
    status IN ('Active', 'Pending');