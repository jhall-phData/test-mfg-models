SELECT
    material_lot_id,
    material_id,
    lot_number,
    quantity,
    status,
    created_at,
    updated_at
FROM
    raw.material_lots
WHERE
    status IN ('Active', 'In Use', 'On Hold')
ORDER BY
    created_at DESC;