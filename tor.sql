SOURCE project.sql;

DROP TABLE IF EXISTS tor_info;
CREATE TABLE tor_info (
    tor_info_id INT AUTO_INCREMENT PRIMARY KEY,
    fk_project_id INT NOT NULL,
    tor_start_date DATE NOT NULL,
    tor_end_date DATE NOT NULL,
    tor_budget DECIMAL(15,2),
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_project_id) REFERENCES project(project_id)
);

DROP TABLE IF EXISTS tor_type;
CREATE TABLE tor_type (
    tor_info_id INT PRIMARY KEY,
    project_type ENUM(
        'NEW_CONSTRUCTION',
        'REBUILD',
        'EXPAND',
        'RENOVATION',
        'REPAIR',
        'MAINTENANCE',
        'DEMOLITION',
        'INTERIOR',
        'LANDSCAPE',
        'INFRASTRUCTURE',
        'FEASIBILITY_STUDY',
        'CONSULTING'
    ) NOT NULL,
    FOREIGN KEY (tor_info_id) REFERENCES tor_info(tor_info_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS tor_location;
CREATE TABLE tor_location (
    tor_info_id INT PRIMARY KEY,
    location_province VARCHAR(50) NOT NULL,
    location_district VARCHAR(50) NOT NULL,
    location_address VARCHAR(100) NOT NULL,
    FOREIGN KEY (tor_info_id) REFERENCES tor_info(tor_info_id) ON DELETE CASCADE
);