SOURCE academician.sql

DROP TABLE IF EXISTS assigned_to;
CREATE TABLE assigned_to (
    work_experience_id INT AUTO_INCREMENT PRIMARY KEY,
    fk_academician_id INT AUTO_INCREMENT NOT NULL,
    fk_specialist_id INT AUTO_INCREMENT NOT NULL,
    position VARCHAR(50) NOT NULL,
    work_type ENUM(
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
    ),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    description VARCHAR(255),
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (fk_academician_id) REFERENCES academician(academician_id) ON DELETE CASCADE
    FOREIGN KEY (fk_specialist_id) REFERENCES specialist(specialist_id)
);