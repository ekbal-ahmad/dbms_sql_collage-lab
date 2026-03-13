-- =========================================
-- DB LAB 6 : GROUP BY AND HAVING
-- Final Oracle Compatible Script
-- =========================================


-- Part A: Basic Aggregate Queries

-- 1. Total number of students
SELECT COUNT(*) AS Total_Students
FROM STUDENT;

-- 2. Total number of faculty members
SELECT COUNT(*) AS Total_Faculty
FROM FACULTY;

-- 3. Total number of courses
SELECT COUNT(*) AS Total_Courses
FROM COURSE;

-- 4. Maximum credits among all courses
SELECT MAX(CREDITS) AS Max_Credits
FROM COURSE;

-- 5. Minimum credits offered by any course
SELECT MIN(CREDITS) AS Min_Credits
FROM COURSE;



-- =========================================
-- Part B: GROUP BY on Single Tables
-- =========================================

-- 6. Number of students in each department
SELECT DEPARTMENT_ID, COUNT(*) AS Number_of_Students
FROM STUDENT
GROUP BY DEPARTMENT_ID;

-- 7. Number of faculty members in each department
SELECT DEPARTMENT_ID, COUNT(*) AS Number_of_Faculty
FROM FACULTY
GROUP BY DEPARTMENT_ID;

-- 8. Number of courses offered by each department
SELECT DEPARTMENT_ID, COUNT(*) AS Number_of_Courses
FROM COURSE
GROUP BY DEPARTMENT_ID;

-- 9. Number of enrollments in each semester
SELECT SEMESTER, COUNT(*) AS Total_EnrollMENTS
FROM ENROLLMENT
GROUP BY SEMESTER;

-- 10. Number of students for each grade
SELECT GRADE, COUNT(*) AS Total_Students
FROM ENROLLMENT
GROUP BY GRADE;



-- =========================================
-- Part C: GROUP BY with HAVING
-- =========================================

-- 11. Departments having more than 3 students
SELECT DEPARTMENT_ID, COUNT(*) AS Total_Students
FROM STUDENT
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 3;

-- 12. Semesters where more than 2 enrollments exist
SELECT SEMESTER, COUNT(*) AS Total_EnrollMENTS
FROM ENROLLMENT
GROUP BY SEMESTER
HAVING COUNT(*) > 2;

-- 13. Grades assigned to more than one student
SELECT GRADE, COUNT(*) AS Total_Students
FROM ENROLLMENT
GROUP BY GRADE
HAVING COUNT(*) > 1;

-- 14. Departments where more than one course is offered
SELECT DEPARTMENT_ID, COUNT(*) AS Total_Courses
FROM COURSE
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 1;



-- =========================================
-- Part D: Aggregation with JOIN
-- =========================================

-- 15. Number of students enrolled in each course
SELECT COURSE_ID, COUNT(STUDENT_ID) AS Enrolled_Students
FROM ENROLLMENT
GROUP BY COURSE_ID;

-- 16. Course name and number of students enrolled
SELECT C.COURSE_NAME, COUNT(E.STUDENT_ID) AS Enrolled_Students
FROM COURSE C
INNER JOIN ENROLLMENT E
ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME;

-- 17. Department and number of students
SELECT DEPARTMENT_ID, COUNT(*) AS Total_Students
FROM STUDENT
GROUP BY DEPARTMENT_ID;

-- 18. Faculty name and number of courses taught
SELECT F.NAME, COUNT(C.COURSE_ID) AS COURSES_TAUGHT
FROM FACULTY F
INNER JOIN COURSE C
ON F.FACULTY_ID = C.FACULTY_ID
GROUP BY F.NAME;

-- =========================================
-- Part E: Analytical Queries
-- =========================================

-- 19. Course name and maximum grade obtained
SELECT C.COURSE_NAME, MAX(E.GRADE) AS Max_Grade
FROM COURSE C
INNER JOIN ENROLLMENT E
ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME;

-- 20. Department and total number of courses
SELECT DEPARTMENT_ID, COUNT(*) AS Total_Courses
FROM COURSE
GROUP BY DEPARTMENT_ID;

-- 21. Semester and total number of students enrolled
SELECT SEMESTER, COUNT(STUDENT_ID) AS Total_Students
FROM ENROLLMENT
GROUP BY SEMESTER;

-- 22. Courses that have more than 2 students enrolled
SELECT COURSE_ID, COUNT(STUDENT_ID) AS Total_Students
FROM ENROLLMENT
GROUP BY COURSE_ID
HAVING COUNT(STUDENT_ID) > 2;
desc faculty ;