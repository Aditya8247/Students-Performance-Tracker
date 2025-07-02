-- Average marks per student
SELECT s.name AS student_name, AVG(e.marks) AS average_marks
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.name;


-- Top 3 students by average marks per department (MySQL 8+)
SELECT department_name, student_name, avg_marks
FROM (
  SELECT 
    d.department_name, 
    s.name AS student_name, 
    AVG(e.marks) AS avg_marks,
    RANK() OVER (PARTITION BY d.department_name ORDER BY AVG(e.marks) DESC) AS ranking
  FROM students s
  JOIN departments d ON s.department_id = d.department_id
  JOIN enrollments e ON s.student_id = e.student_id
  GROUP BY d.department_name, s.name
) ranked
WHERE ranking <= 3;


-- Average marks by course
SELECT c.course_name, AVG(e.marks) AS average_marks
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;


-- Students failing in any course (marks < 40)
SELECT s.name AS student_name, c.course_name, e.marks
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.marks < 40;




