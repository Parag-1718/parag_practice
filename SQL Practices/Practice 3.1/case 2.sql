-- Write a query to retrieve the name and price of all items in the 
-- inventory where the quantity is greater than 0 and the category 
-- is 'electronics', sorted in descending order by price.

CREATE TABLE inventory (
 id INT PRIMARY KEY,
 name VARCHAR(255),
 quantity INT,
 price DECIMAL(10,2),
 category VARCHAR(50)
);

INSERT INTO inventory
VALUES (1, 'Widget A', 10, 5.99, 'Widgets'),
	   (2, 'Gadget B', 20, 12.99, 'Gadgets'),
       (3, 'Mobile', 5, 1225.99, 'Electonics'),
       (4, 'Mouse', 15, 699.99, 'Electonics'),
       (5, 'Book', 8, 17.99, 'Stationary');

select name,price
from inventory
where quantity>0 and category = 'Electonics'
order by price desc;
  
