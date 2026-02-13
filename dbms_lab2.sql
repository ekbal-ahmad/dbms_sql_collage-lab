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
    CONSTRAINT fk_student_dept
        FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);

CREATE TABLE Faculty (
    Faculty_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Designation VARCHAR2(50),
    Email VARCHAR2(100) UNIQUE,
    Department_ID NUMBER,
    CONSTRAINT fk_faculty_dept
        FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);

CREATE TABLE Course (
    Course_ID NUMBER PRIMARY KEY,
    Course_Name VARCHAR2(100) NOT NULL,
    Credits NUMBER CHECK (Credits > 0),
    Department_ID NUMBER,
    Faculty_ID NUMBER,
    CONSTRAINT fk_course_dept
        FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID),
    CONSTRAINT fk_course_faculty
        FOREIGN KEY (Faculty_ID)
        REFERENCES Faculty(Faculty_ID)
);

CREATE TABLE Enrollment (
    Student_ID NUMBER,
    Course_ID NUMBER,
    Semester VARCHAR2(20),
    Grade VARCHAR2(5),
    CONSTRAINT pk_enrollment
        PRIMARY KEY (Student_ID, Course_ID),
    CONSTRAINT fk_enroll_student
        FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),
    CONSTRAINT fk_enroll_course
        FOREIGN KEY (Course_ID)
        REFERENCES Course(Course_ID)
);
