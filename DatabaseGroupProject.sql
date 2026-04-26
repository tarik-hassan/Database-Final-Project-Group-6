DROP TABLE IF EXISTS STUDENTS;
CREATE TABLE STUDENTS (
    studentID varchar(6) PRIMARY KEY NOT NULL,
    first_name varchar(16),
    last_name varchar(32)
);

INSERT INTO STUDENTS VALUES ('JSMI01', 'Joe', 'Smith');
INSERT INTO STUDENTS VALUES ('BJOH02', 'Bob', 'Johnson');
INSERT INTO STUDENTS VALUES ('JBRO03', 'Justin', 'Brown');

DROP TABLE IF EXISTS COURSES;
CREATE TABLE COURSES (
    CRN varchar(4) PRIMARY KEY NOT NULL,
    course_number varchar(4),
    course_name varchar(32),
    semester varchar(6),
    semester_year varchar(4),
    department varchar(32),
    assignment_categories int
);

INSERT INTO COURSES VALUES ('1111', '1010', 'Algorithms and Data Structures', 'Fall', '2025', 'CSC', 4);
INSERT INTO COURSES VALUES ('2222', '2000', 'Linear Algebra', 'Spring', '2026', 'CSC', 5);
INSERT INTO COURSES VALUES ('3333', '3050', 'Intro to Database', 'Spring', '2026', 'CSC', 4);

DROP TABLE IF EXISTS Syllabus;
CREATE TABLE Syllabus (
    categoryID varchar(4) PRIMARY KEY NOT NULL,
    CRN varchar (4),
    course_assignment varchar(32),
    weight dec (5,2),
    FOREIGN KEY (CRN) REFERENCES COURSES (CRN)
);

INSERT INTO Syllabus VALUES ('C001', '1111', 'Participation', 20);
INSERT INTO Syllabus VALUES ('C002', '1111', 'Midterm', 30);
INSERT INTO Syllabus VALUES ('C003', '1111', 'Final', 35);
INSERT INTO Syllabus VALUES ('C004', '1111', 'Project', 15);

INSERT INTO Syllabus VALUES ('C005', '2222', 'Participation', 25);
INSERT INTO Syllabus VALUES ('C006', '2222', 'Homework1', 15);
INSERT INTO Syllabus VALUES ('C007', '2222', 'Homework2', 15);
INSERT INTO Syllabus VALUES ('C008', '2222', 'Homework3', 15);
INSERT INTO Syllabus VALUES ('C009', '2222', 'Final', 30);

INSERT INTO Syllabus VALUES ('C010', '3333', 'Participation', 20);
INSERT INTO Syllabus VALUES ('C011', '3333', 'Paper', 20);
INSERT INTO Syllabus VALUES ('C012', '3333', 'Test1', 30);
INSERT INTO Syllabus VALUES ('C013', '3333', 'Test2', 30);

SELECT * FROM Syllabus WHERE CRN = '1111';
SELECT SUM(weight) FROM Syllabus WHERE CRN = '1111';
SELECT * FROM Syllabus WHERE CRN = '2222';
SELECT SUM(weight) FROM Syllabus WHERE CRN = '2222';
SELECT * FROM Syllabus WHERE CRN = '3333';
SELECT SUM(weight) FROM Syllabus WHERE CRN = '3333';


SELECT * FROM STUDENTS;
SELECT * FROM COURSES;

DROP TABLE IF EXISTS GRADEBOOK;
CREATE TABLE GRADEBOOK (
    assignment_ID varchar(4) PRIMARY KEY NOT NULL,
    CRN varchar(4),
    studentID varchar(16) not null,
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
INSERT INTO GRADEBOOK VALUES ('A004', '1111', 'JSMI01', 'Smith', 'Project', 15.00, 75.00, 0.00);

INSERT INTO GRADEBOOK VALUES ('A005', '2222', 'BJOH02', 'Johnson', 'Participation', 20.00, 95.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A006', '2222', 'BJOH02', 'Johnson', 'Homework1', 30.00, 65.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A007', '2222', 'BJOH02', 'Johnson', 'Homework2', 35.00, 80.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A008', '2222', 'BJOH02', 'Johnson', 'Homework3', 15.00, 100.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A009', '2222', 'BJOH02', 'Johnson', 'Final', 15.00, 88.00, 0.00);

INSERT INTO GRADEBOOK VALUES ('A010', '3333', 'JBRO03', 'Brown', 'Participation', 20.00, 80.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A011', '3333', 'JBRO03', 'Brown', 'Paper', 20.00, 84.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A012', '3333', 'JBRO03', 'Brown', 'Test1', 30.00, 98.00, 0.00);
INSERT INTO GRADEBOOK VALUES ('A013', '3333', 'JBRO03', 'Brown', 'Test2', 30.00, 92.00, 0.00);

UPDATE GRADEBOOK SET weighted_score = (assignment_weight/100)*score;
SELECT * FROM GRADEBOOK;

SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'JSMI01';
SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'BJOH02';
SELECT SUM(weighted_score) FROM GRADEBOOK WHERE studentID = 'JBRO03';
