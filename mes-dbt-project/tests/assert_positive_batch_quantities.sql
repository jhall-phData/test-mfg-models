SELECT *
FROM {{ ref('stg_batches') }}
WHERE batch_quantity <= 0;