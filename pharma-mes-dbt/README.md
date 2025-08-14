# Pharmaceutical Manufacturing Execution System (Pharma MES) DBT Project

This project is designed to implement a Pharmaceutical Manufacturing Execution System (MES) using dbt (data build tool). It focuses on ensuring compliance with industry standards, specifically ISA-88 and ISA-95, while addressing key elements of Pharmaceutical Quality and Chemistry & Manufacturing Controls.

## Project Structure

- **dbt_project.yml**: Configuration settings for the dbt project, including project name, version, and model configurations.
  
- **models/**: Contains SQL models for data transformation and analysis.
  - **staging/**: Staging models for raw data extraction and transformation.
    - `stg_batch_records.sql`: Transforms batch records data.
    - `stg_equipment_status.sql`: Captures equipment status.
    - `stg_quality_tests.sql`: Processes quality test results.
    - `stg_material_lots.sql`: Handles material lot data.
  - **intermediate/**: Intermediate models that integrate and structure data.
    - `int_isa88_procedures.sql`: Integrates ISA-88 procedural data.
    - `int_isa95_operations.sql`: Compiles operational data based on ISA-95.
    - `int_quality_control.sql`: Aggregates quality control data.
  - **marts/**: Final models for reporting and analysis.
    - **pharma_quality/**: Models focused on pharmaceutical quality metrics.
      - `quality_dashboard.sql`: Creates a quality metrics dashboard.
      - `batch_genealogy.sql`: Tracks batch genealogy.
      - `deviation_tracking.sql`: Analyzes deviations in processes.
    - **manufacturing_controls/**: Models for manufacturing performance analysis.
      - `production_performance.sql`: Evaluates production performance metrics.
      - `equipment_efficiency.sql`: Assesses equipment efficiency.
      - `material_consumption.sql`: Analyzes material consumption data.

- **macros/**: Contains reusable SQL macros for common calculations and transformations.
  - `isa88_helpers.sql`: Macros for ISA-88 standards.
  - `quality_calculations.sql`: Macros for quality-related calculations.

- **tests/**: Contains tests to validate data integrity and consistency.
  - `assert_batch_integrity.sql`: Tests for batch records integrity.

- **seeds/**: Reference data for models.
  - `isa88_states.csv`: Predefined states for ISA-88 processes.
  - `quality_specifications.csv`: Quality specifications for materials and products.

- **profiles.yml**: Configuration for database connections.

## Setup Instructions

1. Clone the repository to your local machine.
2. Install dbt and any necessary dependencies.
3. Configure the `profiles.yml` file with your database connection details.
4. Run `dbt run` to execute the models and build the data transformations.
5. Use `dbt test` to validate the integrity of the data.

## Usage Guidelines

This project is intended for use in pharmaceutical manufacturing environments where compliance with quality and manufacturing standards is critical. The models and macros provided can be adapted to fit specific organizational needs while maintaining adherence to ISA-88 and ISA-95 standards.

## Conclusion

The Pharma MES DBT project serves as a comprehensive framework for managing and analyzing pharmaceutical manufacturing data, ensuring quality and compliance throughout the production process.