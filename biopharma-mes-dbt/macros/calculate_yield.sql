SELECT 
    SUM(output_quantity) / NULLIF(SUM(input_quantity), 0) AS yield_percentage
FROM 
    {{ ref('fact_batch_production') }}
WHERE 
    production_date >= '{{ start_date }}' AND production_date <= '{{ end_date }}'