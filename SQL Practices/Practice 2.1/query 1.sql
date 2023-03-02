-- 1. Create a database structure for employee leave application. It 
-- should include all the employee's information as well as their 
-- leave information. 

CREATE TABLE Employees (
    id INT NOT NULL AUTO_INCREMENT,
    email_id VARCHAR(256),
    name VARCHAR(256),
    department VARCHAR(256),
    PRIMARY KEY (id)
);

CREATE TABLE Leaves (
    id INT NOT NULL AUTO_INCREMENT,
    emp_id INT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (emp_id)
        REFERENCES Employees (id)
        ON DELETE CASCADE
);