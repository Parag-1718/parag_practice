CREATE TABLE returnTable (
    return_id INT PRIMARY KEY,
    return_date DATE,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id)
        REFERENCES OrderTable (order_id),
    FOREIGN KEY (product_id)
        REFERENCES Product (product_id)
);
INSERT INTO returnTable (return_id, return_date, order_id, product_id, quantity)
VALUES
(1, '2022-01-01', 1, 1, 2),
(2, '2022-01-02', 2, 2, 1),
(3, '2022-01-03', 3, 3, 3),
(4, '2022-01-04', 4, 4, 1),
(5, '2022-01-05', 5, 5, 2),
(6, '2022-01-06', 6, 6, 1),
(7, '2022-01-07', 7, 7, 2),
(8, '2022-01-08', 8, 8, 1),
(9, '2022-01-09', 9, 9, 1),
(10, '2022-01-10', 10, 10, 2);

-- 1. Write a SQL query to retrieve the names of all customers 
-- who have made at least one order in the "orders" table and 
-- have not made any orders in the "returns" table.

SELECT DISTINCT
    c.customer_name
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
        LEFT JOIN
    returnTable r ON o.order_id = r.order_id
        AND o.product_id = r.product_id
WHERE
    r.order_id IS NULL;


-- 2. Write a SQL query to retrieve the names of all customers 
-- who have made orders in the "orders" table and have 
-- returned at least one item in the "returns" table.

SELECT 
    c.customer_name
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
        JOIN
    returnTable r ON o.order_id = r.order_id
        AND o.product_id = r.product_id
GROUP BY c.customer_id , c.customer_name
HAVING COUNT(DISTINCT o.order_id) > 0
    AND COUNT(DISTINCT r.return_id) > 0;

-- 3. Write a SQL query to retrieve the names of all customers 
-- who have made orders in the "orders" table and have not 
-- returned any items in the "returns" table.

SELECT DISTINCT
    c.customer_name
FROM
    Customer c
        INNER JOIN
    OrderTable o ON c.customer_id = o.customer_id
        LEFT JOIN
    returnTable r ON o.order_id = r.order_id
WHERE
    r.order_id IS NULL;

-- 4. Write a SQL query to retrieve the names of all customers 
-- who have made orders in the "orders" table and have 
-- returned more items than they have ordered.

SELECT 
    c.customer_name
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
        JOIN
    (SELECT 
        order_id, product_id, SUM(quantity) AS total_returned
    FROM
        returnTable
    GROUP BY order_id , product_id) rt ON o.order_id = rt.order_id
        AND o.product_id = rt.product_id;

-- 5. Write a SQL query to retrieve the names of all customers 
-- who have made orders in the "orders" table and have not 
-- returned more items than they have ordered.

SELECT 
    c.customer_name
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
        LEFT JOIN
    (SELECT 
        order_id, SUM(quantity) AS return_qty
    FROM
        returnTable
    GROUP BY order_id) r ON o.order_id = r.order_id
WHERE
    COALESCE(r.return_qty, 0) <= o.quantity
GROUP BY c.customer_name;

-- 6. Write a SQL query to retrieve the names of all customers 
-- who have made orders in the "orders" table and have spent 
-- more than $100 in total on all orders.

SELECT 
    c.customer_name
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name
HAVING SUM(o.total_price) > 100;

-- 7. Write a SQL query to retrieve the names of all customers 
-- who have made orders in the "orders" table and have spent 
-- more than $100 in total on all orders, sorted by the total 
-- amount spent in descending order.

SELECT 
    c.customer_name, SUM(o.total_price) AS total_spent
FROM
    Customer c
        INNER JOIN
    OrderTable o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.total_price) > 100
ORDER BY total_spent DESC;

-- 8. Write a SQL query to retrieve the names of all customers 
-- who have made orders in the "orders" table and have ordered 
-- products in all categories.

SELECT 
    c.customer_name
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
WHERE
    NOT EXISTS( SELECT 
            p.category
        FROM
            Product p
        WHERE
            NOT EXISTS( SELECT 
                    op.product_id
                FROM
                    OrderTable op
                WHERE
                    op.customer_id = c.customer_id
                        AND op.product_id = p.product_id));

-- 9. Write a SQL query to retrieve the names of all customers 
-- who have made orders in the "orders" table and have not 
-- ordered products in all categories.

SELECT DISTINCT
    c.customer_name
FROM
    Customer c
        INNER JOIN
    OrderTable o ON c.customer_id = o.customer_id
        LEFT JOIN
    (SELECT DISTINCT
        o.customer_id, p.category
    FROM
        OrderTable o
    INNER JOIN Product p ON o.product_id = p.product_id) op ON c.customer_id = op.customer_id
WHERE
    op.category IS NULL;

-- 10. Write a SQL query to retrieve the names of all 
-- customers who have made orders in the "orders" table and 
-- have ordered products in at least two different categories.
-- have ordered products in at least two different categories.

SELECT DISTINCT
    c.customer_name
FROM
    Customer c
        JOIN
    OrderTable o ON c.customer_id = o.customer_id
WHERE
    o.category IN (SELECT 
            category
        FROM
            OrderTable
        WHERE
            customer_id = o.customer_id
        GROUP BY category
        HAVING COUNT(DISTINCT product_id) >= 2)