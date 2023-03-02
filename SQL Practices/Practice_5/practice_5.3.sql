-- 1. Write a SQL query to retrieve the names and salaries of all 
-- employees who have a salary greater than the average salary 
-- of all employees.

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

-- 2. Write a SQL query to retrieve the names and total revenue 
-- generated by all customers in the "orders" table, sorted by 
-- revenue in descending order.

SELECT 
    ordertable.category,
    Customer.customer_name,
    SUM(total_price * quantity) AS totalprice
FROM
    orderTable
        INNER JOIN
    Customer ON Customer.customer_id = ordertable.customer_id
GROUP BY customer_name
ORDER BY totalprice DESC;

-- 3. Write a SQL query to retrieve the names and total revenue 
-- generated by all customers in the "orders" table, sorted by 
-- revenue in descending order, where the total revenue is 
-- greater than $10,000.

SELECT 
    ordertable.category,
    Customer.customer_name,
    SUM(total_price * quantity) AS totalprice
FROM
    orderTable
        INNER JOIN
    Customer ON Customer.customer_id = ordertable.customer_id
GROUP BY customer_name
HAVING totalprice > 250
ORDER BY totalprice DESC;

-- 4. Write a SQL query to retrieve the names and total revenue 
-- generated by all customers in the "orders" table, sorted by 
-- revenue in descending order, where the total revenue is 
-- greater than the average revenue generated by all 
-- customers.

SELECT 
    c.customer_name, SUM(o.total_price * o.quantity) AS revenue
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.total_price * o.quantity) > (SELECT 
        AVG(total_revenue)
    FROM
        (SELECT 
            SUM(total_price * quantity) AS total_revenue
        FROM
            OrderTable
        GROUP BY customer_id) AS t)
ORDER BY revenue DESC;


-- 5. Write a SQL query to retrieve the names and total revenue 
-- generated by all customers in the "orders" table, sorted by 
-- revenue in descending order, where the total revenue is 
-- greater than the average revenue generated by all 
-- customers, and the customer is from the "USA" or "Canada".

SELECT 
    c.customer_name,
    c.country,
    SUM(o.total_price * o.quantity) AS revenue
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.total_price * o.quantity) > (SELECT 
        AVG(total_revenue)
    FROM
        (SELECT 
            SUM(total_price * quantity) AS total_revenue
        FROM
            OrderTable
        GROUP BY customer_id) AS t)
    AND (country = 'USA' OR country = 'CANADA')
ORDER BY revenue DESC;

-- 6. Write a SQL query to retrieve the names of all employees 
-- who have made sales greater than $50,000 in the "orders" 
-- table.

SELECT 
    Employee.employee_id,
    Employee.employee_name,
    OrderTable.order_id,
    OrderTable.quantity,
    (orderTable.total_price * OrderTable.quantity) AS TotalPrice
FROM
    Employee
        INNER JOIN
    OrderTable ON OrderTable.order_id = Employee.Order_id
GROUP BY Employee.employee_name
HAVING TotalPrice > 50
ORDER BY TotalPrice DESC;
    
-- 7. Write a SQL query to retrieve the names of all employees 
-- who have made sales greater than the average sales of all 
-- employees in the "orders" table, sorted by sales in 
-- descending order.

SELECT 
    c.customer_name, SUM(o.total_price * o.quantity) AS revenue
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.total_price * o.quantity) > (SELECT 
        AVG(total_revenue)
    FROM
        (SELECT 
            SUM(total_price * quantity) AS total_revenue
        FROM
            OrderTable
        GROUP BY customer_id) AS t)
ORDER BY revenue DESC;

-- 8. Write a SQL query to retrieve the names and total revenue 
-- generated by all customers in the "orders" table, sorted by 
-- revenue in descending order, where the customer is from the 
-- "USA" and the revenue is greater than $5,000.

SELECT 
    c.customer_name,
    c.country,
    SUM(o.total_price * o.quantity) AS revenue
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.total_price * o.quantity) > (SELECT 
        AVG(total_revenue)
    FROM
        (SELECT 
            SUM(total_price * quantity) AS total_revenue
        FROM
            OrderTable
        GROUP BY customer_id) AS t)
    AND revenue > 500
ORDER BY revenue DESC;

-- 9. Write a SQL query to retrieve the names and total revenue 
-- generated by all customers in the "orders" table, sorted by 
-- revenue in descending order, where the customer is from the 
-- "USA" and the revenue is greater than the average revenue 
-- generated by all customers from the "USA".

SELECT 
    c.customer_name,
    c.country,
    SUM(o.total_price * o.quantity) AS revenue
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.total_price * o.quantity) > (SELECT 
        AVG(total_revenue)
    FROM
        (SELECT 
            SUM(total_price * quantity) AS total_revenue
        FROM
            OrderTable
        GROUP BY customer_id) AS t)
ORDER BY revenue DESC;

-- 10. Write a SQL query to retrieve the names and total 
-- revenue generated by all customers in the "orders" table, 
-- sorted by revenue in descending order, where the customer 
-- is from the "USA" and the revenue is greater than the 
-- average revenue generated by all customers, and the 
-- customer has made at least 2 orders

SELECT 
    c.customer_name,
    o.quantity,
    c.country,
    SUM(o.total_price * o.quantity) AS revenue
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.total_price * o.quantity) > (SELECT 
        AVG(total_revenue)
    FROM
        (SELECT 
            SUM(total_price * quantity) AS total_revenue
        FROM
            OrderTable
        GROUP BY customer_id) AS t)
    AND o.quantity >= 2
ORDER BY revenue DESC;