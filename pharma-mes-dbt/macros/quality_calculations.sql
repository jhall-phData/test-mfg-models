-- This file contains macros for performing quality-related calculations, streamlining data transformations.

{% macro calculate_quality_index(passing_tests, total_tests) %}
    CASE 
        WHEN total_tests = 0 THEN 0
        ELSE (passing_tests::float / total_tests) * 100
    END
{% endmacro %}

{% macro calculate_deviation_rate(deviations, total_batches) %}
    CASE 
        WHEN total_batches = 0 THEN 0
        ELSE (deviations::float / total_batches) * 100
    END
{% endmacro %}

{% macro calculate_average_test_result(test_results) %}
    AVG(test_results)
{% endmacro %}