CREATE TABLE sales (
 id INT PRIMARY KEY,
 date DATE,
 customer_id INT,
 product_id INT,
 quantity INT,
 total_price DECIMAL(10,2)
);

INSERT INTO sales (id, date, customer_id, product_id, quantity, total_price)
VALUES
  (1, '2021-01-01', 1001, 2001, 2, 19.98),
  (2, '2021-01-05', 1002, 2002, 1, 12.99),
  (3, '2021-02-10', 1003, 2003, 3, 45.00),
  (4, '2021-02-15', 1001, 2004, 2, 29.98),
  (5, '2021-03-20', 1002, 2005, 1, 9.99),
  (6, '2021-04-25', 1003, 2001, 4, 39.96),
  (7, '2021-05-01', 1001, 2002, 2, 25.98),
  (8, '2021-06-05', 1002, 2003, 1, 15.00),
  (9, '2021-07-10', 1003, 2004, 3, 44.97),
  (10, '2021-08-15', 1001, 2005, 2, 19.98),
  (11, '2021-09-20', 1002, 2001, 1, 9.99),
  (12, '2021-10-25', 1003, 2002, 4, 49.96),
  (13, '2021-11-01', 1001, 2003, 2, 30.00),
  (14, '2021-12-05', 1002, 2004, 1, 14.99),
  (15, '2022-01-10', 1003, 2005, 3, 35.97),
  (16, '2022-02-15', 1001, 2001, 2, 19.98),
  (17, '2022-03-20', 1002, 2002, 1, 12.99),
  (18, '2022-04-25', 1003, 2003, 4, 60.00),
  (19, '2022-05-01', 1001, 2004, 2, 29.98),
  (20, '2022-06-05', 1002, 2005, 1, 9.99);
select * from sales;