-- This model defines the production schedule data structure for ISA-95.

WITH production_schedule AS (
    SELECT
        ps.schedule_id,
        ps.product_id,
        ps.start_time,
        ps.end_time,
        ps.quantity,
        ps.status,
        p.product_name,
        p.product_type
    FROM
        raw.production_schedules ps
    JOIN
        raw.products p ON ps.product_id = p.product_id
)

SELECT
    schedule_id,
    product_id,
    start_time,
    end_time,
    quantity,
    status,
    product_name,
    product_type
FROM
    production_schedule
ORDER BY
    start_time;