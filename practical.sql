CREATE DATABASE student_tracker;
USE student_tracker;
===============================================================================================
# 1.Creating Table 
===============================================================================================
-----------------------------------------------------------------------------------------------
# 1.Departments Table =====>
-----------------------------------------------------------------------------------------------

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
-----------------------------------------------------------------------------------------------
# 2.Student Table =====>
-----------------------------------------------------------------------------------------------
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255),
    admission_date DATE NOT NULL,
    department_id INT NOT NULL,
    CONSTRAINT fk_students_department
        FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
-----------------------------------------------------------------------------------------------
# 3.Faculty Table =====>
-----------------------------------------------------------------------------------------------

CREATE TABLE faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    department_id INT NOT NULL,
    experience_years INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_faculty_department
        FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
-----------------------------------------------------------------------------------------------
# 4.Course Table =====>
-----------------------------------------------------------------------------------------------

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    faculty_id INT,
    CONSTRAINT fk_courses_faculty
        FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);
-----------------------------------------------------------------------------------------------
# 5.Enrollments Table =====>
-----------------------------------------------------------------------------------------------
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    UNIQUE KEY uq_student_course (student_id, course_id),
    CONSTRAINT fk_enrollments_student
        FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_enrollments_course
        FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);
-----------------------------------------------------------------------------------------------
# 6.Atendence Table =====>
-----------------------------------------------------------------------------------------------
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Late') NOT NULL,
    CONSTRAINT fk_attendance_student
        FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_attendance_course
        FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);
-----------------------------------------------------------------------------------------------
# 7.Grades Table =====>
-----------------------------------------------------------------------------------------------
CREATE TABLE grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    marks_obtained DECIMAL(5,2) NOT NULL CHECK (marks_obtained >= 0 AND marks_obtained <= 100),
    CONSTRAINT fk_grades_student
        FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_grades_course
        FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

===============================================================================================
# 2. Insert Date Into Tables 
===============================================================================================

# Departments 

INSERT INTO departments (department_name) VALUES
('Computer Science'),
('Business Administration'),
('Mechanical Engineering'),
('Management');

# Students

INSERT INTO students (name, dob, gender, email, phone_number, address, admission_date, department_id) VALUES
('Aisha Rahman', '2004-05-12', 'Female', 'aisha@gmail.com', '01711111111', 'Dhaka', '2022-01-15', 1),
('Rahim Hassan', '2003-11-20', 'Male', 'rahim@gmail.com', '01822222222', 'Chittagong', '2021-06-10', 1),
('Nabila Karim', '2005-02-03', 'Female', 'nabila@gmail.com', '01933333333', 'Sylhet', '2023-02-05', 2),
('Imran Ali', '2002-09-19', 'Male', 'imran@gmail.com', '01744444444', 'Khulna', '2020-08-22', 3),
('Mitu Das', '2004-07-08', 'Female', 'mitu@gmail.com', '01655555555', 'Rajshahi', '2022-04-12', 1),
('Tanvir Ahmed', '2001-12-30', 'Male', 'tanvir@gmail.com', '01866666666', 'Barishal', '2019-11-03', 4),
('Sadia Akter', '2003-10-15', 'Female', 'sadia@gmail.com', '01777777777', 'Cumilla', '2021-09-21', 2),
('Shuvo Roy', '2004-01-27', 'Male', 'shuvo@gmail.com', '01988888888', 'Jessore', '2022-05-30', 3);

# Faculty

INSERT INTO faculty (name, email, phone_number, department_id, experience_years) VALUES
('Dr. Mehnaz Hasan', 'mehnaz@college.edu', '01710000001', 1, 8),
('Prof. Farhan Kabir', 'farhan@college.edu', '01710000002', 1, 6),
('Mr. Hasan Ali', 'hasan@college.edu', '01710000003', 2, 4),
('Mrs. Shorna Islam', 'shorna@college.edu', '01710000004', 3, 10),
('Dr. Nure Alam', 'nure@college.edu', '01710000005', 4, 7);

# Courses

INSERT INTO courses (course_name, faculty_id) VALUES
('Database Management', 1),
('Operating Systems', 2),
('Accounting Principles', 3),
('Thermodynamics', 4),
('Business Ethics', 5),
('Computer Networks', 2),
('Project Management', 5);

# Enrollments

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-01-10'),
(1, 2, '2023-01-10'),
(2, 1, '2023-01-10'),
(2, 6, '2023-01-12'),
(3, 3, '2023-01-15'),
(4, 4, '2023-01-18'),
(5, 1, '2023-01-10'),
(5, 6, '2023-01-12'),
(6, 5, '2023-01-20'),
(7, 3, '2023-01-15'),
(8, 4, '2023-01-18');

# Attendence

INSERT INTO attendance (student_id, course_id, attendance_date, status) VALUES
(1, 1, '2024-01-02', 'Present'),
(1, 1, '2024-01-04', 'Present'),
(1, 1, '2024-01-06', 'Late'),
(1, 1, '2024-01-08', 'Absent'),
(2, 1, '2024-01-02', 'Present'),
(2, 1, '2024-01-04', 'Present'),
(2, 1, '2024-01-06', 'Present'),
(2, 1, '2024-01-08', 'Absent'),
(3, 3, '2024-01-03', 'Present'),
(3, 3, '2024-01-05', 'Absent'),
(3, 3, '2024-01-07', 'Late'),
(3, 3, '2024-01-09', 'Present'),
(4, 4, '2024-01-02', 'Present'),
(4, 4, '2024-01-04', 'Present'),
(4, 4, '2024-01-06', 'Absent'),
(4, 4, '2024-01-08', 'Present'),
(5, 1, '2024-01-02', 'Present'),
(5, 1, '2024-01-04', 'Late'),
(5, 1, '2024-01-06', 'Absent'),
(5, 1, '2024-01-08', 'Present'),
(6, 5, '2024-01-03', 'Absent'),
(6, 5, '2024-01-05', 'Absent'),
(6, 5, '2024-01-07', 'Absent'),
(6, 5, '2024-01-09', 'Present'),
(7, 3, '2024-01-03', 'Present'),
(7, 3, '2024-01-05', 'Present'),
(7, 3, '2024-01-07', 'Present'),
(7, 3, '2024-01-09', 'Late'),
(8, 4, '2024-01-02', 'Present'),
(8, 4, '2024-01-04', 'Present'),
(8, 4, '2024-01-06', 'Present'),
(8, 4, '2024-01-08', 'Present');

# Grades

INSERT INTO grades (student_id, course_id, marks_obtained) VALUES
(1, 1, 92),
(2, 1, 88),
(3, 3, 76),
(4, 4, 65),
(5, 1, 97),
(6, 5, 48),
(7, 3, 81),
(8, 4, 93),
(1, 2, 89),
(2, 6, 90),
(5, 6, 96);

===============================================================================================
# 3. perform all CRUD Operations
===============================================================================================
-----------------------------------------------------------------------------------------------
# 1.Implement CRUD Operations
-----------------------------------------------------------------------------------------------

#  Insert new student

INSERT INTO students (name, dob, gender, email, phone_number, address, admission_date, department_id)
VALUES ('Fatima Noor', '2005-03-14', 'Female', 'fatima@gmail.com', '01812345678', 'Bogura', '2023-07-01', 1);

# Update student contact details

UPDATE students
SET phone_number = '01812345679', email = 'fatima.noor@gmail.com'
WHERE student_id = (SELECT student_id FROM students WHERE name = 'Fatima Noor');

# Delete a student who has dropped out

DELETE FROM students
WHERE student_id = 8;
-----------------------------------------------------------------------------------------------
# 2. SQL WHERE, HAVING, LIMIT 
-----------------------------------------------------------------------------------------------

# Students enrolled in Computer Science Department

SELECT s.student_id, s.name, d.department_name
FROM students s
JOIN departments d ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

# Top 10 highest-scoring students

SELECT s.student_id, s.name, ROUND(AVG(g.marks_obtained), 2) AS avg_marks
FROM students s
JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.name
ORDER BY avg_marks DESC
LIMIT 10;

# Students with attendance below 75%

SELECT s.student_id, s.name,
       ROUND((SUM(CASE WHEN a.status = 'Present' THEN 1
                       WHEN a.status = 'Late' THEN 0.5
                       ELSE 0 END) / COUNT(a.attendance_id)) * 100, 2) AS attendance_pct
FROM students s
LEFT JOIN attendance a ON s.student_id = a.student_id
GROUP BY s.student_id, s.name
HAVING attendance_pct < 75;
-----------------------------------------------------------------------------------------------
# 3. SQL Operators (AND, OR, NOT)
-----------------------------------------------------------------------------------------------

# Students with attendance below 50% and failing

SELECT s.student_id, s.name,
       ROUND((SUM(CASE WHEN a.status = 'Present' THEN 1
                       WHEN a.status = 'Late' THEN 0.5
                       ELSE 0 END) / COUNT(a.attendance_id)) * 100, 2) AS attendance_pct,
       ROUND(AVG(g.marks_obtained), 2) AS avg_marks
FROM students s
LEFT JOIN attendance a ON s.student_id = a.student_id
LEFT JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.name
HAVING attendance_pct < 50 AND avg_marks < 50;

# Students who scored above 90 OR have perfect attendance

SELECT s.student_id, s.name,
       ROUND(AVG(g.marks_obtained), 2) AS avg_marks,
       ROUND((SUM(CASE WHEN a.status = 'Present' THEN 1
                       WHEN a.status = 'Late' THEN 0.5
                       ELSE 0 END) / COUNT(a.attendance_id)) * 100, 2) AS attendance_pct
FROM students s
LEFT JOIN grades g ON s.student_id = g.student_id
LEFT JOIN attendance a ON s.student_id = a.student_id
GROUP BY s.student_id, s.name
HAVING avg_marks > 90 OR attendance_pct = 100;

# Faculty not assigned to any course

SELECT f.*
FROM faculty f
LEFT JOIN courses c ON f.faculty_id = c.faculty_id
WHERE c.course_id IS NULL;
-----------------------------------------------------------------------------------------------
# 4. Sorting and Grouping Dat
-----------------------------------------------------------------------------------------------

 # List students alphabetically by name
 
SELECT *
FROM students
ORDER BY name ASC;

# Count students in each department

SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_name
ORDER BY student_count DESC;

# Average marks per course

SELECT c.course_name, ROUND(AVG(g.marks_obtained), 2) AS average_marks
FROM courses c
LEFT JOIN grades g ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name
ORDER BY average_marks DESC;

#   Aggregate Functions

# Average attendance percentage of students

WITH attendance_summary AS (
    SELECT s.student_id,
           ROUND((SUM(CASE WHEN a.status = 'Present' THEN 1
                          WHEN a.status = 'Late' THEN 0.5
                          ELSE 0 END) / COUNT(a.attendance_id)) * 100, 2) AS attendance_pct
    FROM students s
    LEFT JOIN attendance a ON s.student_id = a.student_id
    GROUP BY s.student_id
)
SELECT ROUND(AVG(attendance_pct), 2) AS average_attendance_pct
FROM attendance_summary;

# Highest and lowest marks per course

SELECT c.course_name,
       MAX(g.marks_obtained) AS highest_marks,
       MIN(g.marks_obtained) AS lowest_marks
FROM courses c
LEFT JOIN grades g ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name;

# Total students per department

SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_name
ORDER BY total_students DESC;
-----------------------------------------------------------------------------------------------
# 6. Primary and Foreign Key Relationships
-----------------------------------------------------------------------------------------------

# Unique key prevents duplicate enrollment in the same course

SELECT *
FROM enrollments
WHERE student_id = 1 AND course_id = 1;

# Faculty-to-course relationship check

SELECT f.faculty_id, f.name, c.course_name
FROM faculty f
JOIN courses c ON f.faculty_id = c.faculty_id;
-----------------------------------------------------------------------------------------------
# 7. Joins
-----------------------------------------------------------------------------------------------

# Inner join between students and departments

SELECT s.student_id, s.name, d.department_name
FROM students s
INNER JOIN departments d ON s.department_id = d.department_id;

# Students who have not enrolled in any course using LEFT JOIN

SELECT s.student_id, s.name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

# Courses with no faculty assigned using RIGHT JOIN

SELECT c.course_id, c.course_name, f.name AS faculty_name
FROM faculty f
RIGHT JOIN courses c ON f.faculty_id = c.faculty_id
WHERE f.faculty_id IS NULL;

# Students without grades using FULL OUTER JOIN emulation

SELECT s.student_id, s.name, g.grade_id, g.marks_obtained
FROM students s
LEFT JOIN grades g ON s.student_id = g.student_id
UNION
SELECT s.student_id, s.name, g.grade_id, g.marks_obtained
FROM students s
RIGHT JOIN grades g ON s.student_id = g.student_id
WHERE s.student_id IS NULL;
-----------------------------------------------------------------------------------------------
# 8. Subqueries
-----------------------------------------------------------------------------------------------

# Students with marks above average score

SELECT s.student_id, s.name, g.marks_obtained
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE g.marks_obtained > (SELECT AVG(marks_obtained) FROM grades);

# Courses taught by faculty with at least 5 years of experience

SELECT c.course_id, c.course_name
FROM courses c
WHERE c.faculty_id IN (
    SELECT f.faculty_id
    FROM faculty f
    WHERE f.experience_years >= 5
);

# Students who missed more than 10 classes

SELECT s.student_id, s.name, COUNT(a.attendance_id) AS missed_classes
FROM students s
JOIN attendance a ON s.student_id = a.student_id
WHERE a.status = 'Absent'
GROUP BY s.student_id, s.name
HAVING COUNT(a.attendance_id) > 10;
-----------------------------------------------------------------------------------------------
# 9. Date and Time Functions
-----------------------------------------------------------------------------------------------

# Extract month from attendance date

SELECT MONTH(attendance_date) AS attendance_month, COUNT(*) AS records
FROM attendance
GROUP BY MONTH(attendance_date)
ORDER BY attendance_month;

# Calculate years since admission

SELECT student_id, name,
       TIMESTAMPDIFF(YEAR, admission_date, CURDATE()) AS years_since_admission
FROM students;

# Format attendance_date as DD-MM-YYYY

SELECT attendance_id, DATE_FORMAT(attendance_date, '%d-%m-%Y') AS formatted_date
FROM attendance;
-----------------------------------------------------------------------------------------------
 # 10. String Manipulation Functions
-----------------------------------------------------------------------------------------------

# Convert faculty names to uppercase

SELECT UPPER(name) AS faculty_name_uppercase
FROM faculty;

# Trim unnecessary spaces from student names

SELECT TRIM(name) AS trimmed_name
FROM students;

# Replace NULL email values with 'Email Not Provided'

SELECT student_id, name, COALESCE(email, 'Email Not Provided') AS email
FROM students;
-----------------------------------------------------------------------------------------------
# 11. Window Functions
-----------------------------------------------------------------------------------------------
 
# Rank students based on overall marks

SELECT s.student_id, s.name,
       SUM(g.marks_obtained) AS total_marks,
       RANK() OVER (ORDER BY SUM(g.marks_obtained) DESC) AS overall_rank
FROM students s
JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.name;

# Cumulative attendance percentage per course

WITH attendance_summary AS (
    SELECT a.course_id,
           a.student_id,
           ROUND((SUM(CASE WHEN a.status = 'Present' THEN 1
                          WHEN a.status = 'Late' THEN 0.5
                          ELSE 0 END) / COUNT(a.attendance_id)) * 100, 2) AS attendance_pct
    FROM attendance a
    GROUP BY a.course_id, a.student_id
)
SELECT course_id,
       student_id,
       attendance_pct,
       SUM(attendance_pct) OVER (PARTITION BY course_id ORDER BY student_id) AS cumulative_attendance_pct
FROM attendance_summary;

# Running total of students enrolled per month

WITH monthly_enrollments AS (
    SELECT DATE_FORMAT(enrollment_date, '%Y-%m') AS month_name, COUNT(*) AS enrolled_students
    FROM enrollments
    GROUP BY DATE_FORMAT(enrollment_date, '%Y-%m')
)
SELECT month_name,
       enrolled_students,
       SUM(enrolled_students) OVER (ORDER BY month_name) AS running_total
FROM monthly_enrollments;
-----------------------------------------------------------------------------------------------
# 12. CASE Expressions
-----------------------------------------------------------------------------------------------

# Performance levels based on marks

SELECT grade_id, student_id, course_id, marks_obtained,
       CASE
           WHEN marks_obtained > 90 THEN 'Excellent'
           WHEN marks_obtained BETWEEN 75 AND 90 THEN 'Good'
           ELSE 'Needs Improvement'
       END AS performance_level
FROM grades;

# Attendance classification

WITH course_attendance AS (
    SELECT a.student_id,
           a.course_id,
           ROUND((SUM(CASE WHEN a.status = 'Present' THEN 1
                          WHEN a.status = 'Late' THEN 0.5
                          ELSE 0 END) / COUNT(a.attendance_id)) * 100, 2) AS attendance_pct
    FROM attendance a
    GROUP BY a.student_id, a.course_id
)
SELECT student_id,
       course_id,
       attendance_pct,
       CASE
           WHEN attendance_pct > 80 THEN 'Regular'
           WHEN attendance_pct BETWEEN 50 AND 80 THEN 'Irregular'
           ELSE 'Defaulter'
       END AS attendance_status
FROM course_attendance;
================================================================================================
# End of project
================================================================================================