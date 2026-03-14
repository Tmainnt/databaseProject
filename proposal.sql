SOURCE project.sql;

DROP TABLE IF EXISTS proposal;
CREATE TABLE proposal (
    proposal_id SERIAL PRIMARY KEY,
    fk_project_id INT NOT NULL UNIQUE,
    proposal_number VARCHAR(50) NOT NULL,
    proposal_date DATE NOT NULL,
    proposal_status ENUM(
        'DRAFT',
        'SUBMITTED',
        'UNDER_REVIEW',
        'APPROVED',
        'REJECTED',
        'REVISED',
        'WITHDRAWN'
    ) DEFAULT = 'DRAFT',
    proposal_budget DECIMAL(15,2) NOT NULL,
    proposal_start_date DATE NOT NULL,
    proposal_end_date DATE NOT NULL,
    created_timestamp TIMESTAMP NOT NULL,
    update_timestamp TIMESTAMP NOT NULL,
    FOREIGN KEY (fk_project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS proposal_progress;
CREATE TABLE proposal_progress (
    proposal_id INT,
    progression BLOB,
    FOREIGN KEY (proposal_id) REFERENCES proposal(proposal_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS proposal_approval;
CREATE TABLE proposal_approval (
    proposal_id INT,
    approval_date DATE,
    FOREIGN KEY (proposal_id) REFERENCES proposal(proposal_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS proposal_approval;
CREATE TABLE proposal_approval (
    proposal_id INT,
    approval_date DATE,
    FOREIGN KEY (proposal_id) REFERENCES proposal(proposal_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS proposal_document;
CREATE TABLE proposal_document (
    proposal_id INT,
    proposal_file BLOB,
    FOREIGN KEY (proposal_id) REFERENCES proposal(proposal_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS proposal_submitted;
CREATE TABLE proposal_submitted (
    proposal_id INT,
    submitted_by VARCHAR(50),
    FOREIGN KEY (proposal_id) REFERENCES proposal(proposal_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS proposal_approved;
CREATE TABLE proposal_approved (
    proposal_id INT,
    approved_by VARCHAR(50),
    FOREIGN KEY (proposal_id) REFERENCES proposal(proposal_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS proposal_reviewed;
CREATE TABLE proposal_reviewed (
    proposal_id INT,
    reviewed_by VARCHAR(50),
    FOREIGN KEY (proposal_id) REFERENCES proposal(proposal_id) ON DELETE CASCADE
);