# Student Performance & Attendance Tracker

A MySQL database project for managing student and faculty records, course enrollments, attendance, and grades. The SQL script also includes example queries for reporting and practicing common and advanced SQL features.

## Features

- Creates the `student_tracker` database and its tables.
- Stores departments, students, faculty, courses, enrollments, attendance, and grades.
- Enforces primary-key and foreign-key relationships, and prevents duplicate student-course enrollments.
- Adds sample records for demonstrating the queries.
- Demonstrates CRUD operations, filtering, sorting, grouping, and aggregate functions.
- Includes joins, subqueries, date and string functions, window functions, and `CASE` expressions.

## Database schema

The project creates these tables:

| Table | Purpose |
| --- | --- |
| `departments` | Department names |
| `students` | Student details and department |
| `faculty` | Faculty details, department, and years of experience |
| `courses` | Courses and their assigned faculty |
| `enrollments` | Student course registrations |
| `attendance` | Per-course attendance records |
| `grades` | Student marks per course |

## Requirements

- MySQL 8.0 or later. The script uses common table expressions and window functions.
- MySQL Workbench or another MySQL client, or the MySQL command-line client.

## Setup and execution

1. Open `practical.sql` in MySQL Workbench, or navigate to the project folder in a terminal.
2. Run the script against a MySQL server:

   ```bash
   mysql -u your_username -p < practical.sql
   ```

3. Enter your MySQL password when prompted.
4. To inspect the created database, run:

   ```sql
   USE student_tracker;
   SHOW TABLES;
   ```

The script creates `student_tracker` but does not drop or reset it. Run it on a fresh database. To start over, remove the existing database yourself before running the script again:

```sql
DROP DATABASE student_tracker;
```
