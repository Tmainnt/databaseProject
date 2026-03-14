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
    update_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (fk_academician_contact_id) REFERENCES academician_contact(academician_contact_id) ON DELETE CASCADE,
    FOREIGN KEY (academician_file_storage_id) REFERENCES academician_file(academician_file_storage_id) ON DELETE CASCADE,
    /* wait */
);

DROP TABLE IF EXISTS academician_contact;
CREATE TABLE academician_contact (
    academician_contact_id INT AUTO_INCREMENT PRIMARY KEY,
    academician_email VARCHAR(100) NOT NULL,
    academician_phone VARCHAR(10) NOT NULL UNIQUE,
    academician_address TEXT NOT NULL,
    fk_academician_emergency_contact_id INT AUTO_INCREMENT NOT NULL,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (fk_academician_emergency_contact_id) REFERENCES academician_emergency_contact(academician_emergency_contact_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS academician_emergency_contact;
CREATE TABLE academician_emergency_contact (
    academician_contact_id INT AUTO_INCREMENT PRIMARY KEY,
    academician_emergency_contact_phone VARCHAR(10) NOT NULL UNIQUE,
    academician_emergency_contact_name VARCHAR(100) NOT NULL,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

DROP TABLE IF EXISTS academician_file;
CREATE TABLE academician_file (
    academician_file_storage_id INT AUTO_INCREMENT NOT NULL,
    academician_cv_file VARCHAR(100) NOT NULL,
    academician_transcript_card_file VARCHAR(100) NOT NULL,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL 
);

DROP TABLE IF EXISTS academician_has_a_contract;
CREATE TABLE academician_has_a_contract (
    fk_academician_id INT AUTO_INCREMENT NOT NULL,
    fk_academician_contract_number INT(20) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
    FOREIGN KEY (fk_academician_id) REFERENCES academician(academician_id) ON DELETE CASCADE,
    FOREIGN KEY (fk_academician_contract_number) REFERENCES academician_contact(fk_academician_contract_number)
);

DROP TABLE IF EXISTS academician_work_limit;
CREATE TABLE academician_work_limit (
    fk_academician_id INT AUTO_INCREMENT NOT NULL,
    academician_work_limit INT NOT NULL CHECK academician_work_limit >= 0 AND academician_work_limit <= 12,
    default_work_per_day DECIMAL(5,2) CHECK (default_work_per_day >= 0 AND default_work_per_day <= 24),
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

DROP TABLE IF EXISTS academician_critizen_card;
CREATE TABLE academician_critizen_card (
    
);

DROP TABLE IF EXISTS academician_contract;
CREATE TABLE academician_contract (
    
);

DROP TABLE IF EXISTS academician_bank_account;
CREATE TABLE academician_bank_account (
    
);