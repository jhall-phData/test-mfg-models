-- This file contains reusable SQL macros that assist in implementing ISA-88 standards within the dbt models.

{% macro get_batch_status(batch_id) %}
    select 
        status 
    from 
        {{ ref('stg_batch_records') }} 
    where 
        batch_id = {{ batch_id }}
{% endmacro %}

{% macro get_equipment_status(equipment_id) %}
    select 
        status 
    from 
        {{ ref('stg_equipment_status') }} 
    where 
        equipment_id = {{ equipment_id }}
{% endmacro %}

{% macro get_quality_test_results(batch_id) %}
    select 
        * 
    from 
        {{ ref('stg_quality_tests') }} 
    where 
        batch_id = {{ batch_id }}
{% endmacro %}

{% macro get_material_lot_info(lot_id) %}
    select 
        * 
    from 
        {{ ref('stg_material_lots') }} 
    where 
        lot_id = {{ lot_id }}
{% endmacro %}