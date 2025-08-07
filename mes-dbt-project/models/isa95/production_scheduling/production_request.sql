SELECT
    request_id,
    production_order_id,
    product_id,
    quantity_requested,
    request_date,
    status
FROM
    {{ ref('production_schedule') }}
WHERE
    status = 'Pending';