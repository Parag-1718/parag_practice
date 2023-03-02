-- Consider a table called "orders" with the following columns: 
-- "id", "customer_id", "order_date", "total_amount". Write a SQL 
-- query to calculate the total amount of orders for each customer, 
-- sorted in descending order by total amount

CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2)
);
INSERT INTO orders (id, customer_id, order_date, total_amount)
VALUES 
  (1, 101, '2022-01-01', 150.00),
  (2, 102, '2022-01-02', 250.00),
  (3, 103, '2022-01-03', 100.00),
  (4, 101, '2022-01-04', 75.00),
  (5, 104, '2022-01-05', 500.00),
  (6, 103, '2022-01-06', 225.00),
  (7, 102, '2022-01-07', 150.00),
  (8, 105, '2022-01-08', 50.00);
select customer_id,sum(total_amount) as total_amount
from orders
group by customer_id
order by total_amount desc;
