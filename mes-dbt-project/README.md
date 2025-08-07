# Manufacturing Execution Systems (MES) DBT Project

This project is designed to implement a data model for Manufacturing Execution Systems (MES) using dbt. It includes models based on the ISA-88 and ISA-95 standards, which are essential for manufacturing processes.

## Project Structure

- **dbt_project.yml**: Configuration file for the dbt project, including project name, version, and model configurations.
  
- **models/**: Contains all the dbt models organized into different directories:
  - **staging/**: Staging models for extracting and transforming raw data.
    - `stg_equipment.sql`: Equipment data transformation.
    - `stg_procedures.sql`: Procedures data transformation.
    - `stg_batches.sql`: Batches data transformation.
  - **isa88/**: Models based on the ISA-88 standard.
    - **physical_model/**: Represents the physical structure of the ISA-88 model.
      - `enterprise.sql`: Enterprise-level data structure.
      - `site.sql`: Site-level data structure.
      - `area.sql`: Area-level data structure.
      - `process_cell.sql`: Process cell-level data structure.
    - **procedural_model/**: Defines procedures, unit procedures, operations, and phases.
      - `procedure.sql`: Procedures definition.
      - `unit_procedure.sql`: Unit procedures definition.
      - `operation.sql`: Operations definition.
      - `phase.sql`: Phases definition.
    - **recipe_model/**: Defines recipes in the ISA-88 framework.
      - `general_recipe.sql`: General recipes definition.
      - `site_recipe.sql`: Site-specific recipes definition.
      - `master_recipe.sql`: Master recipes definition.
  - **isa95/**: Models based on the ISA-95 standard.
    - **production_scheduling/**: Models for production scheduling.
      - `production_schedule.sql`: Production schedule definition.
      - `production_request.sql`: Production request definition.
    - **production_execution/**: Models for production execution.
      - `work_order.sql`: Work orders definition.
      - `work_response.sql`: Work responses definition.
    - **production_performance/**: Models for production performance metrics.
      - `production_performance.sql`: Production performance metrics definition.
      - `production_capability.sql`: Production capability metrics definition.
    - **product_definition/**: Models for product definitions and production rules.
      - `product_definition.sql`: Product definitions definition.
      - `production_rule.sql`: Production rules definition.
  - **marts/**: Aggregated models for key performance indicators and metrics.
    - `manufacturing_kpis.sql`: Manufacturing KPIs aggregation.
    - `batch_genealogy.sql`: Batch genealogy tracking.
    - `equipment_efficiency.sql`: Equipment efficiency calculation.

- **macros/**: Contains reusable macros.
  - `generate_schema_name.sql`: Macro for generating schema names.

- **seeds/**: Seed files for master data.
  - `equipment_master.csv`: Master data for equipment.
  - `material_master.csv`: Master data for materials.

- **tests/**: Contains tests for data validation.
  - `assert_positive_batch_quantities.sql`: Test for positive batch quantities.

- **profiles.yml**: Configuration for database connections and profiles.

## Setup Instructions

1. Clone the repository.
2. Install dbt and any necessary dependencies.
3. Configure your `profiles.yml` for database connections.
4. Run `dbt run` to execute the models.
5. Use `dbt test` to validate the data.

## Usage Guidelines

This project can be extended by adding new models or modifying existing ones to fit specific manufacturing needs. Ensure to follow the ISA-88 and ISA-95 standards for consistency and reliability in manufacturing data management.