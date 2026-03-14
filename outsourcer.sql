DROP TABLE IF EXISTS outsourcer
CREATE TABLE outsourcer (
    outsourcer_contract_email VARCHAR(50) PRIMARY KEY,
    outsourcer_company_name VARCHAR(50) NOT NULL,
    outsourcer_contract_name VARCHAR(50) NOT NULL,
    outsourcer_contract_phone VARCHAR(10) NOT NULL UNIQUE
);