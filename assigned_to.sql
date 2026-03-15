SOURCE tor.sql;
SOURCE academician.sql;

DROP TABLE IF EXISTS assigned_to;
CREATE TABLE assigned_to (
    assigned_to_id INT AUTO_INCREMENT PRIMARY KEY,
    fk_tor_id INT NOT NULL,
    fk_academician_id INT AUTO_INCREMENT NOT NULL,
    assigned_date DATE,
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (fk_tor_id) REFERENCES tor_info(tor_info_id) ON DELETE CASCADE
    FOREIGN KEY (fk_academician_id) REFERENCES academician(academician_id) ON DELETE CASCADE
);