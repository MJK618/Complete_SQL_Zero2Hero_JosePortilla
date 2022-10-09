CREATE DATABASE SCHOOL;
CREATE TABLE IF NOT EXISTS students
(
    student_id      SERIAL PRIMARY KEY,
    first_name      TEXT,
    last_name       TEXT,
    homeroom_number TEXT,
    phone           TEXT NOT NULL UNIQUE,
    email           VARCHAR UNIQUE,
    graduation_year INT
);
SELECT * FROM students;
CREATE TABLE IF NOT EXISTS teachers
(
    teacher_id      SERIAL PRIMARY KEY,
    first_name      TEXT,
    last_name       TEXT,
    homeroom_number TEXT,
    phone           TEXT NOT NULL UNIQUE,
    email           VARCHAR UNIQUE,
    department TEXT
);
SELECT * FROM teachers;

INSERT INTO students(first_name, last_name, homeroom_number, phone, email, graduation_year)
VALUES ('Mark','Watney','5','777-555-1234','',2035);

INSERT INTO teachers(first_name, last_name, homeroom_number, phone, email, department)
VALUES ('Jonas','Salk','5','777-555-4321','jsalk@school.org','Biology');
TRUNCATE TABLE students;