-- sqlite3 db/students.db <

.headers on 
.mode column
.width auto 

DROP TABLE IF EXISTS students 

CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT);
      