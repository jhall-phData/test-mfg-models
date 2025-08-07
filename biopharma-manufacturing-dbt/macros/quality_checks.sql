-- This macro implements quality checks on data models to ensure data integrity and accuracy.

{% macro quality_checks(model_name) %}
    -- Check for null values in critical fields
    select
        count(*) as null_count
    from {{ model_name }}
    where critical_field is null

    union all

    -- Check for duplicate records
    select
        count(*) as duplicate_count
    from (
        select
            *,
            count(*) over (partition by unique_identifier) as record_count
        from {{ model_name }}
    ) subquery
    where record_count > 1

    union all

    -- Check for valid data ranges
    select
        count(*) as invalid_range_count
    from {{ model_name }}
    where numeric_field < 0 or numeric_field > 100

{% endmacro %}