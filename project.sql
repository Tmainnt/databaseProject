DROP TABLE IF EXISTS outsourcer
CREATE TABLE outsourcer (
    outsourcer_contract_email VARCHAR(50) PRIMARY KEY,
    outsourcer_company_name VARCHAR(50) NOT NULL,
    outsourcer_contract_name VARCHAR(50) NOT NULL,
    outsourcer_contract_phone VARCHAR(10) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS project;
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    project_status enum(
        'DRAFT',
        'PROPOSED',
        'APPROVED',
        'IN_PROGRESS',
        'ON_HOLD',
        'COMPLETED',
        'CANCELLED'
    ) DEFAULT 'DRAFT',
    project_director VARCHAR(50) NOT NULL,
    report_type enum(
        'IEE',
        'EIA',
        'EHIA',
        'COP'
    ),
    created_timestamp TIMESTAMP NOT NULL,
    update_timestamp TIMESTAMP NOT NULL,
    outsourcer_contract_email VARCHAR(50) UNIQUE,
    FOREIGN KEY (outsourcer_contract_email) REFERENCES outsourcer(outsourcer_contract_email),
);

