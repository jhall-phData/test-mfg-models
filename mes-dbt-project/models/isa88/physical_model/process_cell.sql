SELECT
    process_cell_id AS id,
    process_cell_name AS name,
    area_id AS area_id,
    site_id AS site_id,
    enterprise_id AS enterprise_id,
    created_at,
    updated_at
FROM
    raw.process_cells;