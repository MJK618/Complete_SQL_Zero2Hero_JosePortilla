CREATE DATABASE testme;
CREATE TABLE depts (
    first_name VARCHAR(50),
    department VARCHAR(50)
);
INSERT INTO depts(first_name, department)
VALUES
    ('Vinton','A'),
('Lauren','A'),
('Claire','B');

SELECT * FROM depts;

SELECT
    SUM(CASE department WHEN 'A' THEN 1 ELSE 0 END)/
    SUM(CASE department WHEN 'B' THEN 1 ELSE 0 END) AS ratio
FROM depts;

DELETE FROM depts WHERE department='B';

INSERT INTO depts(first_name, department)
VALUES ('Claire','B');
SELECT
    SUM(CASE department WHEN 'A' THEN 1 ELSE 0 END)/
    NULLIF(SUM(CASE department WHEN 'B' THEN 1 ELSE 0 END),0) AS ratio
FROM depts;

