create schema Students_DB;
use Students_DB;

-- Create Departments Table
CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(100)
);

-- Create Students Table
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create Courses Table
CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create Enrollments Table
CREATE TABLE enrollments (
  enrollment_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  semester VARCHAR(10),
  marks INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
