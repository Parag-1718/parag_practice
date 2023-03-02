-- Case 1
-- Assume you are working with a company that has a database 
-- containing information about employees and their departments. 


CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10 , 2 )
);

INSERT INTO Employees VALUES
(1, 'John Smith', 1, 50000.00),
(2, 'Jane Doe', 2, 60000.00),
(3, 'Bob Johnson', 1, 55000.00),
(4, 'Sara Lee', 3, 70000.00),
(5, 'Tom Jones', 2, 65000.00),
(6, 'Amy Johnson', 2, 62000.00),
(7, 'David Lee', 1, 53000.00),
(8, 'Mary Smith', 3, 75000.00),
(9, 'Peter Parker', 2, 68000.00),
(10, 'Karen Davis', 1, 51000.00);


-- Departments table, which includes columns for department ID and 
-- department name.

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO Departments VALUES
(1, 'Marketing'),
(2, 'Sales'),
(3, 'IT');

-- Salaries table, which includes columns for employee ID, salary, 
-- and date.

CREATE TABLE Salaries (
    employee_id INT,
    salary DECIMAL(10 , 2 ),
    date DATE
);

INSERT INTO Salaries VALUES
(1, 50000.00, '2021-01-01'),
(2, 60000.00, '2021-01-01'),
(3, 55000.00, '2021-01-01'),
(4, 70000.00, '2021-01-01'),
(5, 65000.00, '2021-01-01'),
(1, 50000.00, '2021-02-01'),
(2, 60000.00, '2021-02-01'),
(3, 55000.00, '2021-02-01'),
(4, 70000.00, '2021-02-01'),
(5, 65000.00, '2021-02-01');

-- Please write SQL queries to solve the following problems:
-- 1. Write a query to return the names of all employees who work 
-- in the 'Sales' department.

SELECT e.name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id = 2;
    
-- 2. Write a query to return the total number of employees in 
-- each department, ordered by department name.

SELECT d.department_name, COUNT(e.employee_id) AS total_employees
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_id
ORDER BY d.department_name;

-- 3. Write a query to return the average salary for each 
-- department, ordered by department name.

SELECT d.department_name, AVG(s.salary) AS total_employees
FROM salaries s
JOIN employees e ON e.department_id = s.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_id
ORDER BY d.department_name;


-- 4. Write a query to return the top 10% of highest paid 
-- employees, ordered by salary.

SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1;

-- 5. Write a query to return the salary of each employee for 
-- their latest salary entry.

SELECT Salaries.employee_id, Salaries.salary
FROM Salaries
INNER JOIN (
  SELECT employee_id, MAX(date) AS latest_date
  FROM Salaries
  GROUP BY employee_id
) AS latest_salaries
ON Salaries.employee_id = latest_salaries.employee_id
AND Salaries.date = latest_salaries.latest_date;
