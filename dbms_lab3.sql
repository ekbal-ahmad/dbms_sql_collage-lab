-- =====================================================
-- DBMS LAB FINAL COMPLETE PROGRAM
-- B.P. Mandal College of Engineering
-- ==========================
-- CREATE TABLES
-- ==========================

CREATE TABLE Department (
    Department_ID NUMBER PRIMARY KEY,
    Department_Name VARCHAR2(100) NOT NULL,
    Office_Location VARCHAR2(100)
);

CREATE TABLE Student (
    Student_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Date_of_Birth DATE,
    Gender VARCHAR2(10),
    Contact_Number VARCHAR2(15),
    Department_ID NUMBER,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);

CREATE TABLE Faculty (
    Faculty_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Designation VARCHAR2(50),
    Email VARCHAR2(100) UNIQUE,
    Department_ID NUMBER,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);

CREATE TABLE Course (
    Course_ID NUMBER PRIMARY KEY,
    Course_Name VARCHAR2(100) NOT NULL,
    Credits NUMBER CHECK (Credits > 0),
    Department_ID NUMBER,
    Faculty_ID NUMBER,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID),
    FOREIGN KEY (Faculty_ID)
        REFERENCES Faculty(Faculty_ID)
);

CREATE TABLE Enrollment (
    Student_ID NUMBER,
    Course_ID NUMBER,
    Semester VARCHAR2(20),
    Grade VARCHAR2(5),
    PRIMARY KEY (Student_ID, Course_ID),
    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID)
        REFERENCES Course(Course_ID)
);

-- ==========================
-- INSERT DEPARTMENTS
-- ==========================

INSERT INTO Department VALUES (2,'CSE - 2nd Semester','CR-01');
INSERT INTO Department VALUES (3,'CSE - 3rd Semester','CR-02');
INSERT INTO Department VALUES (5,'CSE - 5th Semester','CR-05');
INSERT INTO Department VALUES (7,'CSE - 7th Semester','CR-07');

-- ==========================
-- INSERT FACULTY
-- ==========================

-- 2nd Sem
INSERT INTO Faculty VALUES (201,'Dr. Ajay Kumar','Assistant Professor','ajay2@bpmce.ac.in',2);
INSERT INTO Faculty VALUES (202,'Dr. Manivendra Kumar','Assistant Professor','manivendra2@bpmce.ac.in',2);
INSERT INTO Faculty VALUES (203,'Dr. Manish Kumar Jaiswal','Assistant Professor','manish2@bpmce.ac.in',2);
INSERT INTO Faculty VALUES (204,'Prof. Ashish Kumar Suman','Assistant Professor','ashish2@bpmce.ac.in',2);
INSERT INTO Faculty VALUES (205,'Prof. Arun Kumar','Assistant Professor','arun2@bpmce.ac.in',2);

-- 3rd Sem
INSERT INTO Faculty VALUES (301,'Prof. Amit Kumar','Assistant Professor','amit3@bpmce.ac.in',3);
INSERT INTO Faculty VALUES (302,'Prof. Manisha Kumari Singh','Assistant Professor','manisha3@bpmce.ac.in',3);
INSERT INTO Faculty VALUES (303,'Dr. Jitendra Kumar','Assistant Professor','jitendra3@bpmce.ac.in',3);
INSERT INTO Faculty VALUES (304,'Prof. Praveen Kumar','Assistant Professor','praveen3@bpmce.ac.in',3);

-- 5th Sem
INSERT INTO Faculty VALUES (501,'Prof. E. Haque','Assistant Professor','ehaque5@bpmce.ac.in',5);
INSERT INTO Faculty VALUES (502,'Prof. Sujeet Kumar','Assistant Professor','sujeet5@bpmce.ac.in',5);
INSERT INTO Faculty VALUES (503,'Prof. Md. Izhar','Assistant Professor','izhar5@bpmce.ac.in',5);
INSERT INTO Faculty VALUES (504,'Dr. Prity Kumari Choudhary','Assistant Professor','prity5@bpmce.ac.in',5);
INSERT INTO Faculty VALUES (505,'Prof. Md. Hafeezullah','Assistant Professor','hafeez5@bpmce.ac.in',5);

-- 7th Sem
INSERT INTO Faculty VALUES (701,'Prof. M. P. Singh','Assistant Professor','mps7@bpmce.ac.in',7);
INSERT INTO Faculty VALUES (702,'Dr. Prity Kumari Choudhary','Assistant Professor','prity7@bpmce.ac.in',7);
INSERT INTO Faculty VALUES (703,'Prof. Md. Izhar','Assistant Professor','izhar7@bpmce.ac.in',7);
INSERT INTO Faculty VALUES (704,'Prof. Amit Kumar','Assistant Professor','amit7@bpmce.ac.in',7);

-- ==========================
-- INSERT COURSES (Full Syllabus)
-- ==========================

-- 2nd Sem
INSERT INTO Course VALUES (1001,'Mathematics-II',4,2,201);
INSERT INTO Course VALUES (1002,'Engineering Chemistry',4,2,203);
INSERT INTO Course VALUES (1003,'Basic Electrical Engineering',3,2,202);
INSERT INTO Course VALUES (1004,'Engineering Graphics',3,2,204);
INSERT INTO Course VALUES (1005,'Python Programming',4,2,205);
INSERT INTO Course VALUES (1006,'Workshop Practice',2,2,202);

-- 3rd Sem
INSERT INTO Course VALUES (2001,'Data Structure and Algorithms',4,3,301);
INSERT INTO Course VALUES (2002,'Discrete Mathematics',4,3,302);
INSERT INTO Course VALUES (2003,'Digital Electronics',4,3,303);
INSERT INTO Course VALUES (2004,'Object Oriented Programming',4,3,301);
INSERT INTO Course VALUES (2005,'Computer Organization',4,3,304);
INSERT INTO Course VALUES (2006,'Data Structure Lab',2,3,301);

-- 5th Sem
INSERT INTO Course VALUES (3001,'Artificial Intelligence',4,5,501);
INSERT INTO Course VALUES (3002,'Database Management System',4,5,502);
INSERT INTO Course VALUES (3003,'Formal Language & Automata Theory',4,5,503);
INSERT INTO Course VALUES (3004,'Software Engineering',4,5,504);
INSERT INTO Course VALUES (3005,'Computer Networks',4,5,505);
INSERT INTO Course VALUES (3006,'DBMS Lab',2,5,502);

-- 7th Sem
INSERT INTO Course VALUES (4001,'Project-I',6,7,701);
INSERT INTO Course VALUES (4002,'Human Computer Interaction',4,7,702);
INSERT INTO Course VALUES (4003,'E-Commerce & ERP',4,7,703);
INSERT INTO Course VALUES (4004,'Machine Learning',4,7,704);
INSERT INTO Course VALUES (4005,'Cloud Computing',4,7,701);
INSERT INTO Course VALUES (4006,'Seminar',2,7,702);

-- ==========================
-- INSERT STUDENTS (10)
-- ==========================

INSERT INTO Student VALUES (1,'Rahul Kumar',DATE '2005-05-12','Male','9123456780',2);
INSERT INTO Student VALUES (2,'Amit Singh',DATE '2004-11-21','Male','9234567890',3);
INSERT INTO Student VALUES (3,'Priya Kumari',DATE '2003-02-10','Female','9345678901',5);
INSERT INTO Student VALUES (4,'Anjali Verma',DATE '2002-08-19','Female','9456789012',7);
INSERT INTO Student VALUES (5,'Sandeep Yadav',DATE '2005-01-30','Male','9567890123',2);
INSERT INTO Student VALUES (6,'Neha Singh',DATE '2004-07-22','Female','9678901234',3);
INSERT INTO Student VALUES (7,'Vikash Kumar',DATE '2003-03-17','Male','9789012345',5);
INSERT INTO Student VALUES (8,'Pooja Sharma',DATE '2002-12-05','Female','9890123456',7);
INSERT INTO Student VALUES (9,'Rohit Kumar',DATE '2003-06-25','Male','9901234567',5);
INSERT INTO Student VALUES (10,'Sneha Kumari',DATE '2002-09-15','Female','9012345678',7);

COMMIT;

-- ==========================
-- VERIFY
-- ==========================

SELECT * FROM Department;
SELECT * FROM Faculty;
SELECT * FROM Course;
SELECT * FROM Student;
SELECT * FROM Enrollment;

