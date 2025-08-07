SELECT
    batch_id,
    product_id,
    start_time,
    end_time,
    status,
    quantity_produced,
    quality_metrics,
    operator_id,
    equipment_id
FROM
    raw.batch_records
WHERE
    manufacturing_date >= '2023-01-01'  -- Filter for records from the current year
    AND status IN ('Completed', 'In Progress');  -- Focus on relevant statuses