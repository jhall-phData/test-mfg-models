SELECT
    material_lot_id,
    SUM(consumption_amount) AS total_consumption,
    SUM(consumption_amount) / COUNT(DISTINCT batch_id) AS average_consumption_per_batch,
    MAX(consumption_date) AS last_consumption_date
FROM
    {{ ref('stg_material_lots') }} AS ml
JOIN
    {{ ref('stg_batch_records') }} AS br ON ml.batch_id = br.id
WHERE
    br.status = 'Completed'
GROUP BY
    material_lot_id
ORDER BY
    total_consumption DESC;