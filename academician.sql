DROP TABLE IF EXISTS academician;
CREATE TABLE academician (
    academician_id INT AUTO_INCREMENT PRIMARY KEY,
    academician_fullname VARCHAR(100) NOT NULL,
    academician_date_of_birth DATE NOT NULL,
    academician_gender ENUM(
        'MALE', 
        'FEMALE', 
        'OTHER'
    ) NOT NULL,
    academician_tax_id VARCHAR(50) NOT NULL,
    academician_salary_per_month DECIMAL(10,2) NOT NULL,
    notes TEXT,
    fk_academician_contact_id INT AUTO_INCREMENT NOT NULL,
    fk_academician_critizen_id INT(20) NOT NULL UNIQUE,
    fk_academician_contract_number INT(20) NOT NULL,
    fk_academician_bank_account VARCHAR(50) NOT NULL,
    academician_file_storage_id INT AUTO_INCREMENT NOT NULL,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

