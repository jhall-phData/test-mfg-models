SELECT
    p.product_id,
    p.product_name,
    p.product_type,
    p.product_description,
    p.product_category,
    p.manufacturer,
    p.supplier,
    p.compliance_status,
    p.release_date,
    p.expiration_date,
    p.storage_conditions,
    p.active_ingredient,
    p.dosage_form,
    p.strength,
    p.unit_of_measure,
    p.packaging_type,
    p.packaging_size,
    p.labeling_requirements,
    p.created_at,
    p.updated_at
FROM
    {{ ref('stg_product_specifications') }} AS p
WHERE
    p.compliance_status = 'Approved'