SELECT
    w.work_order_id,
    w.product_id,
    w.start_time,
    w.end_time,
    w.status,
    SUM(CASE WHEN p.status = 'completed' THEN 1 ELSE 0 END) AS completed_phases,
    COUNT(p.phase_id) AS total_phases,
    (SUM(CASE WHEN p.status = 'completed' THEN 1 ELSE 0 END) / COUNT(p.phase_id)) * 100 AS completion_percentage
FROM
    {{ ref('work_order') }} AS w
JOIN
    {{ ref('phase') }} AS p ON w.work_order_id = p.work_order_id
GROUP BY
    w.work_order_id,
    w.product_id,
    w.start_time,
    w.end_time,
    w.status;