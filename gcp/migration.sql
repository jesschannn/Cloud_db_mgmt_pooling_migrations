CREATE TABLE alembic_version (
    version_num VARCHAR(32) NOT NULL, 
    CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);

-- Running upgrade  -> 502c827258bb

ALTER TABLE medical_records ADD COLUMN allergies VARCHAR(100) NOT NULL;

ALTER TABLE medical_records ADD COLUMN pcp VARCHAR(100) NOT NULL;

ALTER TABLE medical_records DROP COLUMN treatment;

ALTER TABLE patients ADD COLUMN insurance VARCHAR(100) NOT NULL;

ALTER TABLE patients MODIFY contact_number VARCHAR(50) NULL;

INSERT INTO alembic_version (version_num) VALUES ('502c827258bb');

