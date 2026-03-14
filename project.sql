SOURCE outsourcer.sql;

DROP TABLE IF EXISTS project;
CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    project_status ENUM(
        'DRAFT',
        'PROPOSED',
        'APPROVED',
        'IN_PROGRESS',
        'ON_HOLD',
        'COMPLETED',
        'CANCELLED'
    ) DEFAULT 'DRAFT',
    project_director VARCHAR(50) NOT NULL,
    report_type ENUM(
        'IEE',
        'EIA',
        'EHIA',
        'COP'
    ),
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    outsourcer_contract_email VARCHAR(50) UNIQUE,
    FOREIGN KEY (outsourcer_contract_email) REFERENCES outsourcer(outsourcer_contract_email) ON DELETE CASCADE
);