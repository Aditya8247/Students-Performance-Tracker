-- Replace '/path/to/file.csv' with your actual local file path
-- Alterbatively use workbench wizard to import data from csv file to tables(No query required)

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/Data_files/departments.csv'
INTO TABLE departments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/Data_files/students.csv'
INTO TABLE students
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/Data_files/courses.csv'
INTO TABLE courses
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/Data_files/enrollments.csv'
INTO TABLE enrollments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
