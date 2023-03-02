CREATE TABLE employees (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER,
  salary INTEGER
);

INSERT INTO employees (id, name, age, salary)
VALUES
  (1, 'John', 35, 60000),
  (2, 'Mary', 27, 50000),
  (3, 'Peter', 42, 75000),
  (4, 'Olivia', 29, 55000),
  (5, 'Michael', 38, 80000);
SELECT * FROM employees;

-- query - 1 ------
SELECT * FROM employees;

-- query - 2 ------
SELECT name, salary 
FROM employees 
WHERE salary > 60000;

-- query - 3 -------
UPDATE employees 
SET age = 43 
WHERE name = 'Peter';

-- query - 4 -------
DELETE FROM employees 
WHERE id = 4;

-- query - 5 -------
SELECT AVG(salary) AS avg_salary 
FROM employees;

-- query - 6 -------
SELECT name, age 
FROM employees 
ORDER BY age DESC 
LIMIT 1;

-- query - 7 -------
SELECT name, age 
FROM employees 
ORDER BY age 
LIMIT 1;

-- query -8 -------
SELECT name 
FROM employees 
ORDER BY salary DESC
LIMIT 1;




