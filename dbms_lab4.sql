-- =====================================================
-- DB-LAB-4 FINAL PROGRAM
-- Data Retrieval Using SQL (Read-Only Queries)
-- Based on DB-LAB-3 Tables
-- Oracle SQL Developer Compatible
-- =====================================================


-- ==============================
-- PART A: BASIC DATA DISPLAY
-- ==============================

-- 1. Display all columns from Student with aliases
SELECT 
    Student_ID AS Roll_No,
    Name AS Student_Name,
    Date_of_Birth AS DOB,
    Gender AS Gender,
    Contact_Number AS Contact,
    Department_ID AS Dept_ID
FROM Student;

-- 2. Display StudentID, Name, DepartmentID with new names
SELECT 
    Student_ID AS Roll_No,
    Name AS Student_Name,
    Department_ID AS Dept_ID
FROM Student;

-- 3. Display Faculty details with readable names
SELECT 
    Faculty_ID AS Faculty_No,
    Name AS Faculty_Name,
    Designation AS Job_Title,
    Email AS Email_Address
FROM Faculty;

-- 4. Display Course table with renamed headers
SELECT 
    Course_ID AS Course_Code,
    Course_Name AS Course_Title,
    Credits AS Credit_Value,
    Department_ID AS Dept_ID,
    Faculty_ID AS Faculty_No
FROM Course;

-- 5. Display Enrollment with meaningful aliases
SELECT 
    Student_ID AS Student,
    Course_ID AS Course,
    Semester AS Semester_Name,
    Grade AS Final_Grade
FROM Enrollment;


-- ==============================
-- PART B: WHERE CLAUSE
-- ==============================

-- 6. Students from Department 1
SELECT * FROM Student
WHERE Department_ID = 1;

-- 7. Female students
SELECT * FROM Student
WHERE Gender = 'Female';

-- 8. Assistant Professors
SELECT * FROM Faculty
WHERE Designation = 'Assistant Professor';

-- 9. Faculty from Department 1
SELECT * FROM Faculty
WHERE Department_ID = 1;

-- 10. Courses with credits >= 4
SELECT * FROM Course
WHERE Credits >= 4;

-- 11. Students born after 1 Jan 2003
SELECT * FROM Student
WHERE Date_of_Birth > DATE '2003-01-01';

-- 12. Enrollment for 3rd Semester
SELECT * FROM Enrollment
WHERE Semester = '3rd Semester';


-- ==============================
-- PART C: SORTING & LIMITING
-- ==============================

-- 13. Students sorted by Name
SELECT * FROM Student
ORDER BY Name ASC;

-- 14. Students sorted by DOB descending
SELECT * FROM Student
ORDER BY Date_of_Birth DESC;

-- 15. Faculty sorted by Designation
SELECT * FROM Faculty
ORDER BY Designation ASC;

-- 16. Courses sorted by Credits descending
SELECT * FROM Course
ORDER BY Credits DESC;

-- 17. First 3 students
SELECT * FROM Student
FETCH FIRST 3 ROWS ONLY;

-- 18. First 5 courses
SELECT * FROM Course
FETCH FIRST 5 ROWS ONLY;


-- ==============================
-- PART D: DERIVED OUTPUT
-- ==============================

-- 19. Student Name with Age
SELECT 
    Name,
    FLOOR(MONTHS_BETWEEN(SYSDATE, Date_of_Birth)/12) AS Age
FROM Student;

-- 20. Course with Updated Credits
SELECT 
    Course_Name,
    Credits + 1 AS Updated_Credits
FROM Course;

-- 21. Enrollment with Grade as Final_Grade
SELECT 


    Student_ID,
    Course_ID,
    Semester,
    Grade AS Final_Grade
FROM Enrollment;

-- 22. Student Name with Birth Year
SELECT 
    Name,
    EXTRACT(YEAR FROM Date_of_Birth) AS Birth_Year
FROM Student;

-- 23. Faculty Name with Email Domain
SELECT 
    Name,
    SUBSTR(Email, INSTR(Email,'@')+1) AS Email_Domain
FROM Faculty;
