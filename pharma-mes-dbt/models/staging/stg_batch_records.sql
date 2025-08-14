SELECT
    batch_id,
    product_id,
    start_time,
    end_time,
    status,
    quantity_produced,
    quantity_defective,
    operator_id,
    equipment_id,
    recipe_id
FROM
    raw.batch_records
WHERE
    status IN ('Completed', 'In Progress')
    AND start_time >= '2023-01-01'
    AND end_time <= CURRENT_DATE;