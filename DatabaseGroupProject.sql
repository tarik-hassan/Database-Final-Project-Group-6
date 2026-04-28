DROP TABLE STUDENTS CASCADE CONSTRAINTS;
CREATE TABLE STUDENTS (
    studentID varchar(6) PRIMARY KEY NOT NULL,
    first_name varchar(16),
    last_name varchar(32)
);

INSERT INTO STUDENTS VALUES ('JSMI01', 'Joe', 'Smith');
INSERT INTO STUDENTS VALUES ('BJOH02', 'Bob', 'Johnson');
INSERT INTO STUDENTS VALUES ('JBRO03', 'Justin', 'Brown');
INSERT INTO STUDENTS VALUES ('MJON04', 'Mary', 'Jones');
INSERT INTO STUDENTS VALUES ('OWIL05', 'Olivia', 'Williams');
INSERT INTO STUDENTS VALUES ('DROB06', 'David', 'Roberts');
INSERT INTO STUDENTS VALUES ('TMIL07', 'Thomas', 'Miller');

SELECT * FROM STUDENTS;

DROP TABLE COURSES CASCADE CONSTRAINTS;
CREATE TABLE COURSES (
    CRN varchar(4) PRIMARY KEY NOT NULL,
    course_number varchar(4),
    course_name varchar(32),
    semester varchar(6),
    semester_year varchar(4),
    department varchar(32),
    assignment_categories int
);

INSERT INTO COURSES VALUES ('1111', '1010', 'Algorithms and Data Structures', 'Spring', '2026', 'CSC', 4);
INSERT INTO COURSES VALUES ('2222', '2000', 'Linear Algebra', 'Spring', '2026', 'CSC', 5);
INSERT INTO COURSES VALUES ('3333', '3050', 'Intro to Database', 'Spring', '2026', 'CSC', 4);

SELECT * FROM COURSES;

DROP TABLE SYLLABUS CASCADE CONSTRAINTS;
CREATE TABLE SYLLABUS (
    categoryID varchar(4) PRIMARY KEY NOT NULL,
    CRN varchar (4),
    course_assignment varchar(32),
    weight dec (5,2),
    FOREIGN KEY (CRN) REFERENCES COURSES (CRN)
);

INSERT INTO SYLLABUS VALUES ('C001', '1111', 'Participation', 20);
INSERT INTO SYLLABUS VALUES ('C002', '1111', 'Midterm', 30);
INSERT INTO SYLLABUS VALUES ('C003', '1111', 'Final', 35);
INSERT INTO SYLLABUS VALUES ('C004', '1111', 'Project', 15);

INSERT INTO SYLLABUS VALUES ('C005', '2222', 'Participation', 25);
INSERT INTO SYLLABUS VALUES ('C006', '2222', 'Homework1', 15);
INSERT INTO SYLLABUS VALUES ('C007', '2222', 'Homework2', 15);
INSERT INTO SYLLABUS VALUES ('C008', '2222', 'Homework3', 15);
INSERT INTO SYLLABUS VALUES ('C009', '2222', 'Final', 30);

INSERT INTO SYLLABUS VALUES ('C010', '3333', 'Participation', 20);
INSERT INTO SYLLABUS VALUES ('C011', '3333', 'Paper', 20);
INSERT INTO SYLLABUS VALUES ('C012', '3333', 'Test1', 30);
INSERT INTO SYLLABUS VALUES ('C013', '3333', 'Test2', 30);

SELECT * FROM SYLLABUS;

SELECT * FROM SYLLABUS WHERE CRN = '1111';
SELECT SUM(weight) FROM SYLLABUS WHERE CRN = '1111';
SELECT * FROM SYLLABUS WHERE CRN = '2222';
SELECT SUM(weight) FROM SYLLABUS WHERE CRN = '2222';
SELECT * FROM SYLLABUS WHERE CRN = '3333';
SELECT SUM(weight) FROM SYLLABUS WHERE CRN = '3333';

DROP TABLE GRADEBOOK CASCADE CONSTRAINTS;
CREATE TABLE GRADEBOOK (
    assignment_ID varchar(4) PRIMARY KEY NOT NULL,
    CRN varchar(4),
    studentID varchar(16),
    last_name varchar(16),
    assignment_name varchar(16),
    assignment_weight dec (5,2),
    score dec (5,2),
    weighted_score dec (5,2),
    FOREIGN KEY (studentID) REFERENCES STUDENTS (studentID),
    FOREIGN KEY (CRN) REFERENCES COURSES (CRN)
);

INSERT INTO GRADEBOOK VALUES ('A001', '1111', 'JSMI01', 'Smith', 'Participation', 20.00, 100.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A002', '1111', 'JSMI01', 'Smith', 'Midterm', 30.00, 85.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A003', '1111', 'JSMI01', 'Smith', 'Final', 35.00, 90.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A004', '1111', 'JSMI01', 'Smith', 'Project', 15.00, 95.00, 0.00);

INSERT INTO GRADEBOOK VALUES ('A005', '1111', 'MJON04', 'Jones', 'Participation', 20.00, 88.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A006', '1111', 'MJON04', 'Jones', 'Midterm', 30.00, 93.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A007', '1111', 'MJON04', 'Jones', 'Final', 35.00, 77.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A008', '1111', 'MJON04', 'Jones', 'Project', 15.00, 98.00, 0.00);

INSERT INTO GRADEBOOK VALUES ('A009', '1111', 'OWIL05', 'Williams', 'Participation', 20.00, 72.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A010', '1111', 'OWIL05', 'Williams', 'Midterm', 30.00, 84.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A011', '1111', 'OWIL05', 'Williams', 'Final', 35.00, 65.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A012', '1111', 'OWIL05', 'Williams', 'Project', 15.00, 83.00, 0.00);

INSERT INTO GRADEBOOK VALUES ('A013', '2222', 'BJOH02', 'Johnson', 'Participation', 20.00, 95.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A014', '2222', 'BJOH02', 'Johnson', 'Homework1', 30.00, 65.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A015', '2222', 'BJOH02', 'Johnson', 'Homework2', 35.00, 80.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A016', '2222', 'BJOH02', 'Johnson', 'Homework3', 15.00, 100.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A017', '2222', 'BJOH02', 'Johnson', 'Final', 15.00, 88.00, 0.00);

INSERT INTO GRADEBOOK VALUES ('A018', '2222', 'DROB06', 'Roberts', 'Participation', 25.00, 97.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A019', '2222', 'DROB06', 'Roberts', 'Homework1', 15.00, 92.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A020', '2222', 'DROB06', 'Roberts', 'Homework2', 15.00, 94.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A021', '2222', 'DROB06', 'Roberts', 'Homework3', 15.00, 90.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A022', '2222', 'DROB06', 'Roberts', 'Final', 30.00, 96.00, 0.00);

INSERT INTO GRADEBOOK VALUES ('A023', '3333', 'JBRO03', 'Brown', 'Participation', 20.00, 80.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A024', '3333', 'JBRO03', 'Brown', 'Paper', 20.00, 84.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A025', '3333', 'JBRO03', 'Brown', 'Test1', 30.00, 98.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A026', '3333', 'JBRO03', 'Brown', 'Test2', 30.00, 92.00, 0.00);

INSERT INTO GRADEBOOK VALUES ('A027', '3333', 'TMIL07', 'Miller', 'Participation', 20.00, 80.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A028', '3333', 'TMIL07', 'Miller', 'Paper', 20.00, 84.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A029', '3333', 'TMIL07', 'Miller', 'Test1', 30.00, 98.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A030', '3333', 'TMIL07', 'Miller', 'Test2', 30.00, 92.00, 0.00);

UPDATE GRADEBOOK SET weighted_score = (assignment_weight/100)*score;

SELECT * FROM GRADEBOOK;

SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'JSMI01';
SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'MJON04';
SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'OWIL05';
SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'BJOH02';
SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'DROB06';
SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'JBRO03';
SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'TMIL07';

SELECT * FROM GRADEBOOK where studentID = 'JSMI01';
SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'JSMI01';
UPDATE GRADEBOOK SET score = 63.00 WHERE studentID = 'JSMI01' and assignment_name = 'Project';
UPDATE GRADEBOOK SET weighted_score = (assignment_weight/100)*score;
SELECT * FROM GRADEBOOK where studentID = 'JSMI01';
SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'JSMI01';
