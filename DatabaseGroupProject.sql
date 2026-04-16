DROP TABLE STUDENTS;
CREATE TABLE STUDENTS (
    studentID varchar(6) PRIMARY KEY NOT NULL,
    first_name varchar(16),
    last_name varchar(32)
);

INSERT INTO STUDENTS VALUES ('JSMI01', 'Joe', 'Smith');
INSERT INTO STUDENTS VALUES ('BJOH02', 'Bob', 'Johnson');
INSERT INTO STUDENTS VALUES ('JBRO03', 'Justin', 'Brown');

DROP TABLE COURSES;
CREATE TABLE COURSES (
    course_number varchar(4) PRIMARY KEY NOT NULL,
    course_name varchar(32),
    semester varchar(6),
    semester_year varchar(4),
    department varchar(32)
);

INSERT INTO COURSES VALUES ('1010', 'Algorithms and Data Structures', 'Fall', '2025', 'CSC');
INSERT INTO COURSES VALUES ('2000', 'Linear Algebra', 'Spring', '2026', 'CSC');
INSERT INTO COURSES VALUES ('3050', 'Intro to Database', 'Spring', '2026', 'CSC');

DROP TABLE CALCULATION CASCADE CONSTRAINTS;
CREATE TABLE CALCULATION (
    student_ID varchar(4) NOT NULL,
    course_number varchar(4) NOT NULL,
    assesment varchar(32),
    w decimal(5,2),
    grade decimal(5,2),
    weighted_grade decimal(5,2)
);

DROP TABLE ASSESTMENTS;
CREATE TABLE ASSESTMENTS (
    course_number varchar2 (4) PRIMARY KEY NOT NULL,
    assessment varchar (32)
);

DROP TABLE LETTER;
CREATE TABLE LETTER (
    letter varchar2 (1)
);