SOURCE project.sql

DROP TABLE IF EXISTS tor_info;
CREATE TABLE tor_info (
    tor_info_id SERIAL PRIMARY KEY,
    fk_project_id INT,
    tor_start_date DATE NOT NULL,
    tor_end_date DATE NOT NULL,
    tor_budget DECIMAL(15,2),
    created_timestamp TIMESTAMP,
    FOREIGN KEY (fk_project_id) REFERENCES project(project_id),
);