-- 1. Write a SQL query to retrieve the names of all customers 
-- who have placed orders for products in the "Electronics" 
-- category, along with the total amount they have spent on 
-- all orders. The output should be sorted by the total amount 
-- spent in descending order.

SELECT 
    OrderTable.order_id,
    OrderTable.category,
    SUM(OrderTable.total_price) AS order_by_SUM,
    Customer.customer_name
FROM
    Customer
        INNER JOIN
    ordertable ON ordertable.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY order_by_SUM DESC;

-- 2. Write a SQL query to retrieve the names of all employees 
-- who have sold at least one product in the "Clothing" 
-- category, along with the total revenue they have generated 
-- from those sales. The output should be sorted by total 
-- revenue generated in descending order.

SELECT 
    OrderTable.category,
    SUM(OrderTable.total_price) AS order_by_SUM
FROM
    Customer
        INNER JOIN
    ordertable ON ordertable.customer_id = customer.customer_id
        INNER JOIN
    Employee ON Employee.customer_id = customer.customer_id
GROUP BY OrderTable.category
HAVING OrderTable.category = 'Clothing'
ORDER BY order_by_SUM DESC;


-- 3. Write a SQL query to retrieve the names of all customers 
-- who have placed orders for products in both the 
-- "Electronics" and "Clothing" categories. The output should 
-- only include customers who have ordered products in both 
-- categories.

SELECT 
    Customer.customer_name, Customer.customer_id
FROM
    Customer
        INNER JOIN
    OrderTable o1 ON Customer.customer_id = o1.customer_id
        INNER JOIN
    OrderTable o2 ON Customer.customer_id = o2.customer_id
WHERE
    o1.Category = 'Electronics'
        AND o2.Category = 'Clothing';

-- 4. Write a SQL query to retrieve the names of all employees 
-- who have sold at least one product to a customer who has a 
-- shipping address in the same city as the employee. The 
-- output should only include employees who have made at least 
-- one such sale.

SELECT DISTINCT
    Employee.employee_name
FROM
    Employee
        INNER JOIN
    OrderTable ON Employee.employee_id = OrderTable.customer_id
        INNER JOIN
    Product ON OrderTable.product_id = Product.product_id
        INNER JOIN
    Customer ON OrderTable.customer_id = Customer.customer_id
WHERE
    Customer.city = Employee.city;


-- 5. Write a SQL query to retrieve the names of all customers 
-- who have placed orders for products in the "Electronics" 
-- category, but have never placed an order for products in 
-- the "Clothing" category.

SELECT 
    Customer.customer_name,
    Customer.customer_id,
    o1.Category,
    o2.Category
FROM
    Customer
        INNER JOIN
    OrderTable o1 ON Customer.customer_id = o1.customer_id
        INNER JOIN
    OrderTable o2 ON Customer.customer_id = o2.customer_id
WHERE
    o1.Category != 'Clothing'
        AND o2.Category != 'Clothing'
GROUP BY Customer.customer_name
ORDER BY Customer.customer_id;

-- 6. Write a SQL query to retrieve the names of all employees 
-- who have sold at least one product to customers who have 
-- placed orders for products in the "Electronics" category, 
-- but have never placed an order for products in the 
-- "Clothing" category. The output should only include 
-- employees who have made at least one such sale.


SELECT DISTINCT
    e.employee_name
FROM
    Employee e
        INNER JOIN
    OrderTable o ON e.order_id = o.order_id
        INNER JOIN
    Product p ON o.product_id = p.product_id
        INNER JOIN
    Customer c ON o.customer_id = c.customer_id
WHERE
    p.category = 'Electronics'
        AND NOT EXISTS( SELECT 
            1
        FROM
            OrderTable o2
                INNER JOIN
            Product p2 ON o2.product_id = p2.product_id
        WHERE
            o2.customer_id = o.customer_id
                AND p2.category = 'Clothing');

-- 7. Write a SQL query to retrieve the names of all customers 
-- who have placed orders for more than five different 
-- products in the "Electronics" category.

SELECT 
    c.customer_name
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
        JOIN
    Product p ON o.product_id = p.product_id
WHERE
    p.category = 'Electronics'
GROUP BY c.customer_id
HAVING COUNT(DISTINCT o.product_id) > 5;

-- 8. Write a SQL query to retrieve the names of all employees 
-- who have sold products to customers who have placed orders 
-- for more than five different products in the "Electronics" 
-- category. The output should only include employees who have 
-- made at least one such sale

SELECT DISTINCT
    e.employee_name
FROM
    Employee e
        JOIN
    OrderTable o ON o.customer_id = e.customer_id
        JOIN
    Product p ON p.product_id = o.product_id
WHERE
    p.category = 'Electronics'
GROUP BY e.employee_id , o.customer_id
HAVING COUNT(DISTINCT o.product_id) > 5