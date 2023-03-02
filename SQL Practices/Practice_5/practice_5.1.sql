

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    country VARCHAR(50)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10 , 2 )
);

CREATE TABLE OrderTable (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10 , 2 ),
    category VARCHAR(256),
    FOREIGN KEY (customer_id)
        REFERENCES Customer (customer_id),
    FOREIGN KEY (product_id)
        REFERENCES Product (product_id)
);


INSERT INTO Customer (customer_id, customer_name, email, phone_number)
VALUES
(1, 'John Smith', 'johnsmith@example.com', '123-456-7890'),
(2, 'Jane Doe', 'janedoe@example.com', '555-555-1212'),
(3, 'Bob Johnson', 'bjohnson@example.com', '888-888-8888'),
(4, 'Alice Jones', 'ajones@example.com', '555-123-4567'),
(5, 'Charlie Brown', 'cbrown@example.com', '555-867-5309'),
(6, 'Ethan Lee', 'ethanlee@example.com', '555-555-5555'),
(7, 'Olivia Chen', 'oliviachen@example.com', '555-444-3333'),
(8, 'Lucas Kim', 'lucaskim@example.com', '555-333-2222'),
(9, 'Ava Patel', 'avapatel@example.com', '555-222-1111'),
(10, 'Liam Nguyen', 'liamnguyen@example.com', '555-111-0000');

UPDATE Customer 
SET 
    city = CASE customer_id
        WHEN 1 THEN 'New York'
        WHEN 2 THEN 'Los Angeles'
        WHEN 3 THEN 'Chicago'
        WHEN 4 THEN 'Houston'
        WHEN 5 THEN 'Philadelphia'
        WHEN 6 THEN 'Phoenix'
        WHEN 7 THEN 'San Antonio'
        WHEN 8 THEN 'San Diego'
        WHEN 9 THEN 'Dallas'
        WHEN 10 THEN 'San Jose'
    END,
    country = CASE customer_id
        WHEN 1 THEN 'USA'
        WHEN 2 THEN 'USA'
        WHEN 3 THEN 'USA'
        WHEN 4 THEN 'USA'
        WHEN 5 THEN 'USA'
        WHEN 6 THEN 'USA'
        WHEN 7 THEN 'USA'
        WHEN 8 THEN 'USA'
        WHEN 9 THEN 'USA'
        WHEN 10 THEN 'USA'
    END;

UPDATE Customer 
SET 
    country = 'USA'
WHERE
    customer_id IN (1 , 2, 4, 5, 7);

UPDATE Customer 
SET 
    country = 'Canada'
WHERE
    customer_id IN (3 , 6, 8);

UPDATE Customer 
SET 
    country = 'India'
WHERE
    customer_id = 9;

UPDATE Customer 
SET 
    country = 'Vietnam'
WHERE
    customer_id = 10;

ALTER TABLE Product ADD COLUMN category VARCHAR(50);

INSERT INTO Product (product_id, product_name, price)
VALUES
(1, 'Widget', 10.00),
(2, 'Gizmo', 5.00),
(3, 'Thingamajig', 15.00),
(4, 'Doohickey', 7.50),
(5, 'Whatchamacallit', 20.00),
(6, 'Doodad', 12.00),
(7, 'Gadget', 8.50),
(8, 'Thingummy', 18.00),
(9, 'Whatsit', 25.00),
(10, 'Doohickey Deluxe', 15.00);

INSERT INTO Product (category)
VALUES
('Electronics'),
('Electronics'),
('Clothing'),
('Electronics'),
('Clothing'),
('Electronics'),
('Electronics'),
('Clothing'),
('Electronics'),
('Clothing');

UPDATE Product 
SET 
    category = 'Electronics'
WHERE
    product_id IN (1 , 2, 4, 6, 7, 9);

UPDATE Product 
SET 
    category = 'Clothing'
WHERE
    product_id IN (3 , 5, 8, 10);

INSERT INTO OrderTable (order_id, order_date, customer_id, product_id, quantity, total_price)
VALUES
(1, '2023-02-01', 1, 1, 3, 30.00),
(2, '2023-02-02', 2, 2, 2, 10.00),
(3, '2023-02-03', 3, 1, 1, 10.00),
(4, '2023-02-04', 4, 4, 4, 30.00),
(5, '2023-02-05', 5, 3, 1, 15.00),
(6, '2023-02-06', 1, 5, 2, 40.00),
(7, '2023-02-07', 2, 3, 3, 45.00),
(8, '2023-02-08', 3, 2, 1, 5.00),
(9, '2023-02-09', 4, 1, 2, 20.00),
(10, '2023-02-10', 5, 4, 3, 22.50),
(11, '2023-02-11', 1, 3, 2, 30.00),
(12, '2023-02-12', 2, 4, 1, 7.50),
(13, '2023-02-13', 3, 5, 4, 80.00),
(14, '2023-02-14', 4, 3, 1, 9.50),
(15, '2023-02-15', 2, 7, 2, 17.00),
(16, '2023-02-16', 5, 9, 1, 25.00),
(17, '2023-02-17', 3, 8, 3, 54.00),
(18, '2023-02-18', 1, 6, 4, 48.00),
(19, '2023-02-19', 4, 10, 2, 30.00),
(20, '2023-02-20', 5, 2, 2, 17.00),
(21, '2023-02-21', 1, 5, 1, 5.00),
(22, '2023-02-22', 3, 1, 3, 24.00),
(23, '2023-02-23', 4, 8, 2, 36.00),
(24, '2023-02-24', 2, 4, 1, 6.00);

UPDATE OrderTable 
SET 
    Category = 'Electronics'
WHERE
    order_id IN (1 , 3, 5, 9, 7, 11, 13, 15, 17, 19, 21, 23);

UPDATE OrderTable 
SET 
    Category = 'Clothing'
WHERE
    order_id IN (2 , 4, 6, 8, 10, 12, 14, 16, 18, 20);

UPDATE OrderTable 
SET 
    Category = 'Electronics'
WHERE
    order_id IN (22 , 24);
-- 1. Write a SQL query to retrieve the top 10 customers who have made 
-- the most orders in the "orders" table, along with the total 
-- number of orders they have made.

SELECT 
    OrderTable.order_id,
    COUNT(customer.customer_id) AS order_by_customer,
    Customer.customer_name
FROM
    Customer
        INNER JOIN
    ordertable ON ordertable.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY order_by_customer DESC;

-- 2. Write a SQL query to retrieve the names of all employees who have 
-- sold more than $100,000 worth of products in the "order_details" 
-- table, sorted by the amount sold in descending order.
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    salary DECIMAL(10 , 2 ) NOT NULL,
    customer_id INT,
    order_id INT,
    product_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES Customer (customer_id),
    FOREIGN KEY (order_id)
        REFERENCES OrderTable (order_id),
    FOREIGN KEY (product_id)
        REFERENCES Product (product_id)
);
ALTER TABLE Employee
ADD city VARCHAR(50),
ADD country VARCHAR(50);

INSERT INTO Employee (employee_id, employee_name, salary, customer_id, order_id, product_id)
VALUES 
    (1, 'John Doe', 50000.00, 1, 1, 1),
    (2, 'Jane Smith', 60000.00, 2, 2, 2),
    (3, 'Bob Johnson', 55000.00, 3, 3, 3),
    (4, 'Mary Brown', 65000.00, 4, 4, 4),
    (5, 'David Lee', 70000.00, 5, 5, 5),
    (6, 'Jennifer Lee', 75000.00, 6, 6, 6),
    (7, 'Richard Rodriguez', 80000.00, 7, 7, 7),
    (8, 'Sarah Kim', 85000.00, 8, 8, 8),
    (9, 'Michael Nguyen', 90000.00, 9, 9, 9),
    (10, 'Amanda Chen', 95000.00, 10, 10, 10),
    (11, 'Tom Smith', 60000.00, 1, 11, 1),
    (12, 'Karen Johnson', 55000.00, 2, 12, 2),
    (13, 'John Brown', 65000.00, 3, 13, 3),
    (14, 'Anna Lee', 75000.00, 4, 14, 4),
    (15, 'Jason Lee', 85000.00, 5, 15, 5);
UPDATE Employee 
SET 
    city = 'New York',
    country = 'USA'
WHERE
    employee_id IN (1 , 2, 3, 4, 5);

UPDATE Employee 
SET 
    city = 'Los Angeles',
    country = 'USA'
WHERE
    employee_id IN (6 , 7, 8, 9, 10);

UPDATE Employee 
SET 
    city = 'San Francisco',
    country = 'USA'
WHERE
    employee_id IN (11 , 12, 13, 14, 15);

SELECT 
    e.employee_id,
    SUM(o.quantity * o.total_price) AS total_sales
FROM
    Employee e
        INNER JOIN
    OrderTable o ON e.order_id = o.order_id
HAVING SUM(o.quantity * o.total_price) > 1000
ORDER BY total_sales DESC;

-- 3. Write a SQL query to retrieve the names of all customers who have 
-- made orders in the "orders" table, along with the total amount 
-- they have spent on all orders and the total amount they have 
-- spent on orders made in the last 30 days.

SELECT 
    ordertable.order_id,
    ordertable.order_date,
    ordertable.total_price,
    customer.customer_id,
    customer.customer_name
FROM
    ordertable
        INNER JOIN
    customer ON customer.customer_id = ordertable.order_id
HAVING ordertable.order_date > '2023-01-25';

-- 4. Write a SQL query to retrieve the names and salaries of all 
-- employees who have a salary greater than the average salary of 
-- all employees in the "employees" table, sorted by salary in 
-- descending order.

SELECT 
    employee_id, employee_name, salary
FROM
    employee
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employee)
ORDER BY salary DESC;
    
-- 5. Write a SQL query to retrieve the names of all customers who have 
-- made orders in the "orders" table, but have not made any orders 
-- in the last 90 days.

SELECT 
    ordertable.order_id,
    ordertable.order_date,
    ordertable.total_price,
    customer.customer_id,
    customer.customer_name
FROM
    ordertable
        INNER JOIN
    customer ON customer.customer_id = ordertable.order_id
HAVING ordertable.order_date < '2022-12-25';

-- 6. Write a SQL query to retrieve the names and salaries of all 
-- employees who have a salary greater than the minimum salary of 
-- their department in the "employees" table, sorted by department 
-- ID and then by salary in descending order.

SELECT 
    employee_id, employee_name, salary
FROM
    employee
WHERE
    salary > (SELECT 
            MIN(salary)
        FROM
            employee)
ORDER BY salary DESC;
-- 7. Write a SQL query to retrieve the names and salaries of the five 
-- highest paid employees in each department of the "employees" 
-- table, sorted by department ID and then by salary in descending 
-- order.

SELECT 
    employee_id, employee_name, salary
FROM
    employee
WHERE
    salary > (SELECT 
            MIN(salary)
        FROM
            employee)
ORDER BY salary DESC
LIMIT 5;
-- 8. Write a SQL query to retrieve the names of all customers who have 
-- made orders in the "orders" table, but have not made any orders 
-- for products in the "products" table with a price greater than 
-- $100.

SELECT 
    OrderTable.order_id, product.price, Customer.customer_name
FROM
    Customer
        INNER JOIN
    ordertable ON ordertable.customer_id = customer.customer_id
        INNER JOIN
    product ON product.product_id = orderTable.product_id
HAVING product.price > '10.00'
ORDER BY product.price DESC;

-- 9. Write a SQL query to retrieve the names of all customers who have 
-- made orders in the "orders" table, along with the total amount 
-- they have spent on all orders and the average amount they have 
-- spent per order.

SELECT 
    OrderTable.order_id,
    SUM(OrderTable.total_price) AS order_by_SUM,
    AVG(OrderTable.total_price) AS order_by_AVG,
    Customer.customer_name
FROM
    Customer
        INNER JOIN
    ordertable ON ordertable.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY order_by_SUM DESC;

-- 10. Write a SQL query to retrieve the names of all products in 
-- the "products" table that have been ordered by customers in more 
-- than one country, along with the names of the countries where the 
-- products have been ordered.

SELECT 
    OrderTable.order_id,
    Product.product_name,
    Customer.customer_name,
    Customer.country
FROM
    Customer
        INNER JOIN
    ordertable ON ordertable.customer_id = customer.customer_id
        INNER JOIN
    product ON product.product_id = orderTable.product_id
ORDER BY product.price DESC;
