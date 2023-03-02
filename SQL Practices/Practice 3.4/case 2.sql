CREATE TABLE Employees (
  id INT PRIMARY KEY,
  First_name VARCHAR(256),
  last_name VARCHAR(256),
  hire_date DATE,
  salary DECIMAL(10,2),
  dept_id INT
);
CREATE TABLE Departments (
  id INT PRIMARY KEY,
  dept_name VARCHAR(256),
  manager_id INT,
  FOREIGN KEY (manager_id) REFERENCES Employees(id) ON DELETE CASCADE
);
CREATE TABLE Titles (
  id INT PRIMARY KEY,
  emp_id INT,
  title VARCHAR(256),
  FOREIGN KEY (emp_id) REFERENCES Employees(id) ON DELETE CASCADE
);
CREATE TABLE Dependents (
  id INT PRIMARY KEY,
  emp_id INT,
  First_name VARCHAR(256),
  last_name VARCHAR(256),
  relation VARCHAR(256),
  FOREIGN KEY (emp_id) REFERENCES Employees(id) ON DELETE CASCADE
);

INSERT INTO Employees (id, First_name, last_name, hire_date, salary, dept_id)
VALUES
  (1, 'John', 'Doe', '2022-02-01', 50000.00, 1),
  (2, 'Jane', 'Smith', '2021-10-15', 60000.00, 2),
  (3, 'Bob', 'Johnson', '2020-05-01', 45000.00, 1),
  (4, 'Sarah', 'Davis', '2019-08-12', 70000.00, 3),
  (5, 'David', 'Lee', '2022-01-20', 55000.00, 2),
  (6, 'Emily', 'Clark', '2021-03-10', 48000.00, 1),
  (7, 'Mike', 'Brown', '2020-07-01', 62000.00, 2),
  (8, 'Karen', 'Garcia', '2018-11-01', 75000.00, 3);
  
INSERT INTO Departments (id, dept_name, manager_id)
VALUES
  (1, 'Sales', 2),
  (2, 'Marketing', 7),
  (3, 'Engineering', 4);
  

INSERT INTO Titles (id, emp_id, title)
VALUES
  (1, 1, 'Manager'),
  (2, 2, 'Sales Associate'),
  (3, 3, 'Marketing Manager'),
  (4, 4, 'Software Engineer'),
  (5, 5, 'Senior Software Engineer'),
  (6, 6, 'Sales Associate'),
  (7, 7, 'Marketing Specialist'),
  (8, 8, 'Software Engineer');

INSERT INTO Dependents (id, emp_id, First_name, last_name, relation)
VALUES
  (1, 1, 'Jane', 'Doe', 'Spouse'),
  (2, 1, 'John', 'Doe Jr.', 'Child'),
  (3, 3, 'Emily', 'Smith', 'Spouse'),
  (4, 4, 'James', 'Lee', 'Child'),
  (5, 5, 'Olivia', 'Johnson', 'Child'),
  (6, 5, 'Liam', 'Johnson', 'Child'),
  (7, 6, 'Sophia', 'Wilson', 'Child'),
  (8, 7, 'Ava', 'Davis', 'Child');
  
-- 1. Write a query that returns the first and last name of all 
-- employees who have a title that contains the word 
-- "Manager".
SELECT E.first_name, E.last_name
FROM Employees E
INNER JOIN Titles T 
ON E.id = T.emp_id
WHERE T.title LIKE '%Manager%';

-- 2. Write a query that returns the department name and the 
-- average salary of all employees in each department.
SELECT D.dept_name, AVG(E.salary) AS average_salary
FROM Employees E
INNER JOIN Departments D 
ON E.dept_id = D.id
GROUP BY D.dept_name;

-- 3. Write a query that returns the number of employees who were 
-- hired in each year, sorted by year.
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS total_employees
FROM Employees
GROUP BY hire_year
ORDER BY hire_year;

-- 4. Write a query that returns the first name, last name, and 
-- salary of the top 10 highest-paid employees.
SELECT first_name, last_name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 10;

-- 5. Write a query that updates the salary of all employees in 
-- the "Sales" department to be 10% higher than their current 
-- salary.
UPDATE Employees
SET salary = salary * 1.1
WHERE dept_id = (SELECT id FROM Departments WHERE dept_name = 'Sales');

-- 6. Write a query that deletes all employees who were hired 
-- before the year 2000.
DELETE FROM Employees
WHERE YEAR(hire_date) < 2000;

-- 7. Write a query that creates a new table called 
-- "employee_stats" that contains the following columns: 
-- "department_name", "total_employees", and "average_salary". 
-- The table should include one row for each department.
CREATE TABLE employee_stats (
    dept_name varchar(50),
    total_employees int,
    average_salary decimal(10,2)
);
INSERT INTO employee_stats (dept_name, total_employees, average_salary)
SELECT D.dept_name, COUNT(*), AVG(E.salary)
FROM Employees E
INNER JOIN Departments D 
ON E.dept_id = D.id
GROUP BY D.dept_name;
-- select * from employee_stats; 

-- 8. Write a query that returns the first and last name of all 
-- employees who have the same last name as their manager.



-- 9. Write a query that returns the top 5 departments with the 
-- highest average salary.
SELECT D.dept_name, AVG(E.salary) AS average_salary
FROM Employees E
INNER JOIN Departments D 
ON E.dept_id = D.id
GROUP BY D.dept_name
ORDER BY average_salary DESC
LIMIT 5;

-- 10. Write a query that returns the first and last name of 
-- all employees who have at least one dependent. Sort the 
-- results by last name
SELECT e.first_name, e.last_name
FROM Employees e
JOIN Dependents d ON e.id = d.emp_id
GROUP BY e.id, e.first_name, e.last_name
HAVING COUNT(d.id) >= 1
ORDER BY e.last_name;
 
