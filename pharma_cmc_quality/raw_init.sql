-- DDL for Pharmaceutical Quality Source Tables

-- Defines raw materials, APIs, and excipients
CREATE OR REPLACE TABLE materials (
    material_id         INTEGER PRIMARY KEY,
    material_name       VARCHAR(255),
    material_type       VARCHAR(50),
    supplier_id         INTEGER,
    created_at          TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- Defines the finished drug products
CREATE OR REPLACE TABLE products (
    product_id          INTEGER PRIMARY KEY,
    product_name        VARCHAR(255),
    dosage_form         VARCHAR(100),
    strength            VARCHAR(50),
    api_material_key    INTEGER, -- Foreign key to the specific API in the materials table
    created_at          TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- Defines the master list of all analytical tests
CREATE OR REPLACE TABLE tests (
    test_id                 INTEGER PRIMARY KEY,
    test_name               VARCHAR(255),
    test_method_document    VARCHAR(100),
    created_at              TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- Defines the quality specifications for materials or products
CREATE OR REPLACE TABLE specifications (
    spec_id             INTEGER PRIMARY KEY,
    spec_for_id         INTEGER, -- The ID of the material or product this spec applies to
    version             INTEGER,
    effective_date      DATE 
);

-- Links a specification to its required tests and acceptance criteria
CREATE CREATE OR REPLACE TABLE specification_tests (
    spec_test_id        INTEGER PRIMARY KEY,
    spec_id             INTEGER, -- Foreign key to specifications table
    test_id             INTEGER, -- Foreign key to tests table
    acceptance_criteria VARCHAR(255)
);

-- Represents a specific manufacturing run or batch
CREATE OR REPLACE TABLE lots (
    lot_id              INTEGER PRIMARY KEY,
    lot_number          VARCHAR(100),
    product_id          INTEGER, -- Foreign key to products table
    material_id         INTEGER, -- Foreign key to materials table
    manufacture_date    DATE,
    expiry_date         DATE,
    status              VARCHAR(50), -- e.g., 'Quarantined', 'Released'
    created_at          TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- Stores the actual data from quality control testing of a lot
CREATE CREATE OR REPLACE TABLE test_results (
    result_id           INTEGER PRIMARY KEY,
    lot_id              INTEGER, -- Foreign key to lots table
    spec_test_id        INTEGER, -- Foreign key to specification_tests table
    result_value        VARCHAR(100),
    result_status       VARCHAR(50) -- e.g., 'Pass', 'Fail', 'OOS'
);