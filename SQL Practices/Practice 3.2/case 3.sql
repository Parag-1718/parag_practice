-- Consider a table called "employees" with the following columns: 
-- "id", "name", "department", "salary". Write a SQL query to 
-- retrieve the names and salaries of all employees in the "sales" 
-- department who earn more than $50,000 per year.



CREATE TABLE employees (
 id INT PRIMARY KEY,
 name VARCHAR(256),
 department VARCHAR(256),
 salary DECIMAL(10,2)
);
INSERT INTO employees (id, name, department, salary)
VALUES 
(1, 'John Doe', 'Sales', 50000.00),
(2, 'Jane Smith', 'Marketing', 60000.00),
(3, 'Bob Johnson', 'IT', 70000.00),
(4, 'Sarah Lee', 'HR', 55000.00),
(5, 'David Kim', 'Engineering', 80000.00),
(6, 'Emily Chen', 'IT', 75000.00),
(7, 'Mike Davis', 'Finance', 65000.00),
(8, 'Lisa Wang', 'Marketing', 55000.00),
(9, 'Jennifer Lee', 'Sales', 65000),
(10, 'Alex Wong', 'Human Resources', 60000),
(11, 'Rachel Chen', 'Finance', 75000),
(12, 'Mark Davis', 'Sales', 80000),
(13, 'Emily Johnson', 'Engineering', 90000);

select name,salary
from employees
where department = 'Sales' and salary > 50000;