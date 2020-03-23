-- sqlite3 db/students.db < student_trials.sql

.headers on 
.mode column
.width auto 

DROP TABLE IF EXISTS students;

CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT);

INSERT INTO students (id, name, grade) VALUES (1, "M", "9th")

SELECT id FROM students DESC LIMIT 1      