import mysql.connector
import pandas as pd

#  Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",         # or your server host
    user="root",              # your username
    password="*********", # your password
    database="Students_DB"  # your database name
)

# Define SQL query (Top 3 students per department)
query = """
SELECT department_name, student_name, avg_marks FROM (
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
"""

# Load into pandas DataFrame
df = pd.read_sql(query, conn)

# Export to CSV
df.to_csv("top_3_students_per_department.csv", index=False)


# Close connection
conn.close()

print("Report exported successfully!")
