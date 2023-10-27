CREATE TABLE alembic_version (
    version_num VARCHAR(32) NOT NULL, 
    CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);

-- Running upgrade  -> 77782db1afe7

ALTER TABLE patients MODIFY contact_number VARCHAR(50) NULL;

INSERT INTO alembic_version (version_num) VALUES ('77782db1afe7');

-- Running upgrade 77782db1afe7 -> d360f215c235

ALTER TABLE medical_records ADD COLUMN allergies VARCHAR(100) NOT NULL;

ALTER TABLE medical_records ADD COLUMN pcp VARCHAR(100) NOT NULL;

ALTER TABLE patients ADD COLUMN insurance VARCHAR(100) NOT NULL;

UPDATE alembic_version SET version_num='d360f215c235' WHERE alembic_version.version_num = '77782db1afe7';

