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
CRN varchar(4) PRIMARY KEY NOT NULL,
course_number varchar(4),
course_name varchar(32),
semester varchar(6),
semester_year varchar(4),
department varchar(32)
);


INSERT INTO COURSES VALUES ('0011', '1010', 'Algorithms and Data Structures', 'Fall', '2025', 'CSC');
INSERT INTO COURSES VALUES ('0022', '2000', 'Linear Algebra', 'Spring', '2026', 'CSC');
INSERT INTO COURSES VALUES ('0033', '3050', 'Intro to Database', 'Spring', '2026', 'CSC');

select * from students;
select * from courses;


DROP TABLE GRADEBOOK;
CREATE TABLE GRADEBOOK (
assignment_ID varchar(4) PRIMARY KEY NOT NULL,
crn varchar(4),
studentid varchar(16) not null,
assignment_name varchar(16),
a_weight dec (5,2),
score dec (5,2),
weighted int
foreign key(studentid) references students(studentid),
foreign key(crn) references courses(crn)
);
--must foreign key be a primary key form ebfore?
insert into gradebook values('A001', '0011', 'JSMI01', 'quiz1', 10.00, 90.00, score*a_weight);
insert into gradebook values('A002', '0011', 'JSMI01', 'quiz2', 90.00, 100.00);



select * from gradebook;
--new table or grab from prev tables
--
--select students from
--course to gradebook
--create table assignment?
--how to calculate weight automaticallt and store it automatically?
--test aggregate func
--what other thigns to add for creativity

select from gradebook where student_id