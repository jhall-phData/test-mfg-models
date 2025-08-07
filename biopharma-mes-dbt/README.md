# Biopharmaceutical Manufacturing MES DBT Project

This project is designed to support the biopharmaceutical manufacturing process through data transformation and analysis using dbt (data build tool). It focuses on staging, processing, and reporting on various aspects of manufacturing, quality control, and regulatory compliance.

## Project Structure

- **models/**: Contains SQL models for staging, intermediate processing, and marts.
  - **staging/**: Models that prepare raw data for analysis.
    - `stg_batch_records.sql`: Stages batch records from the manufacturing process.
    - `stg_equipment_logs.sql`: Stages equipment logs capturing operational data.
    - `stg_quality_tests.sql`: Stages quality test results for analysis.
    - `stg_material_usage.sql`: Stages material usage records detailing raw material consumption.
  - **intermediate/**: Models that aggregate and summarize data.
    - `int_batch_processing.sql`: Aggregates and processes batch data.
    - `int_equipment_utilization.sql`: Analyzes equipment utilization rates.
    - `int_quality_metrics.sql`: Calculates intermediate quality metrics.
  - **marts/**: Final models for reporting and analysis.
    - **manufacturing/**: Contains models related to manufacturing metrics.
      - `dim_products.sql`: Dimension table for product specifications.
      - `dim_equipment.sql`: Dimension table for equipment specifications.
      - `fact_batch_production.sql`: Fact table for batch production metrics.
      - `fact_quality_control.sql`: Fact table for quality control metrics.
    - **regulatory/**: Contains models for regulatory compliance.
      - `batch_genealogy.sql`: Captures batch genealogy data for traceability.
      - `compliance_reporting.sql`: Prepares data for compliance reporting.
  
- **macros/**: Contains reusable SQL macros.
  - `calculate_yield.sql`: Macro to calculate yield percentages.
  - `validate_batch_integrity.sql`: Macro to validate batch record integrity.

- **seeds/**: Contains seed data files.
  - `equipment_master.csv`: Master list of equipment used in manufacturing.
  - `product_specifications.csv`: Specifications for manufactured products.

- **tests/**: Contains tests for validating data integrity.
  - `assert_batch_completeness.sql`: Test for checking completeness of batch records.

- **dbt_project.yml**: Configuration file for the dbt project.

## Usage Instructions

1. **Setup**: Ensure you have dbt installed and configured to connect to your data warehouse.
2. **Run Models**: Use the command `dbt run` to execute the models and build the tables/views in your data warehouse.
3. **Test Models**: Use the command `dbt test` to run tests and validate data integrity.
4. **Documentation**: Generate documentation using `dbt docs generate` and view it with `dbt docs serve`.

This project aims to enhance data-driven decision-making in biopharmaceutical manufacturing by providing a robust framework for data transformation and analysis.