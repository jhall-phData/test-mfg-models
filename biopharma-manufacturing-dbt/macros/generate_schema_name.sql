-- This macro generates schema names dynamically based on specified parameters, facilitating organized data management.

{% macro generate_schema_name(schema_prefix, environment) %}
    {{ return(schema_prefix ~ '_' ~ environment) }}
{% endmacro %}