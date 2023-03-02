create table users(
     id int primary key,
     name text,
     email text,
     password text,
     created_at timestamp,
     updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);
create table orders(
    id int,
    user_id int,
    amount float,
    created_at timestamp,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);

insert into users (id, name, email, password, created_at, updated_at) 
values
(1, 'John Doe', 'johndoe@example.com', 'password1', '2022-01-01 10:00:00', '2022-01-02 11:00:00'),
(2, 'Jane Smith', 'janesmith@example.com', 'password2', '2022-01-02 10:00:00', '2022-01-03 11:00:00'),
(3, 'Mike Johnson', 'mikejohnson@example.com', 'password3', '2022-01-03 10:00:00', '2022-01-04 11:00:00'),
(4, 'Samantha Lee', 'samanthalee@example.com', 'password4', '2022-01-04 10:00:00', '2022-01-05 11:00:00'),
(5, 'Robert Brown', 'robertbrown@example.com', 'password5', '2022-01-05 10:00:00', '2022-01-06 11:00:00'),
(6, 'Emily Davis', 'emilydavis@example.com', 'password6', '2022-01-06 10:00:00', '2022-01-07 11:00:00'),
(7, 'David Garcia', 'davidgarcia@example.com', 'password7', '2022-01-07 10:00:00', '2022-01-08 11:00:00');

insert into orders (id, user_id, amount, created_at)
values
(1,1, 10.5, '2022-01-01 10:00:00'),
(2,2, 20.5, '2022-01-02 10:00:00'),
(3,3, 30.5, '2022-01-03 10:00:00'),
(4,4, 40.5, '2022-01-04 10:00:00'),
(5,1, 50.5, '2022-01-05 10:00:00'),
(6,3, 60.5, '2022-01-06 10:00:00');

-- 1. Create a new user with the following information:
-- name: John Doe
-- email: john.doe@example.com
-- password: 123456
-- created_at: current timestamp
-- updated_at: current timestamp
insert into users (id,name,email,password,created_at,updated_at)
values 
(8, 'John Doe', 'john.doe@example.com', '123456', now(), now());
select * from users;

-- 2. Retrieve the names and email addresses of all users who 
-- have placed at least one order.
select u.name,u.email,count(o.id) as num_orders
from users u
inner join orders o
on u.id = o.user_id
group by u.id 
having num_orders >= 1;

-- 3. Retrieve the total amount of orders placed by each user, 
-- sorted in descending order of total amount.
select u.name,count(o.id) as num_orders
from users u
inner join orders o
on u.id = o.user_id
group by u.id 
order by num_orders desc;

-- 4. Retrieve the email address of the user who has placed the 
-- most orders.
select u.email,count(o.id) as num_orders
from users u
inner join orders o
on u.id = o.user_id
group by u.id
order by num_orders desc
limit 1;

-- 5. Retrieve the user IDs and the total amount of orders placed 
-- by users who have placed at least one order and whose total 
-- amount of orders exceeds $100.
select u.id,sum(o.amount) as total_amount
from users u
inner join orders o
on u.id = o.user_id
group by u.id
having total_amount > 100;

-- 6. Retrieve the number of users who have not placed any 
-- orders.
select * 
from users u
left join orders o
on u.id = o.user_id
where o.user_id is null;

-- 7. Update the user with ID 1 to change their email address to 
-- "jane.doe@example.com"
update users 
set email = 'jane.doe@example.com'
where id = 1;

-- 8. Delete all orders placed by users whose email address 
-- contains the string "test".
delete orders
from orders 
join users 
on orders.user_id = users.id
where users.email like '%tset%';


-- 9. Retrieve the total amount of orders placed on each day of 
-- the current week, grouped by day.
select sum(amount)as total_amount,date(created_at)as order_date
from orders
where yearweek(created_at) = yearweek(now())
group by order_date;

-- 10. Retrieve the IDs and email addresses of users who have 
-- placed an order in the current year and whose email address 
-- is in the format "example.com"
select u.id,u.email 
from users u
join orders o
on u.id = o.user_id
where year(o.created_at) = year(now()) and u.email like '%@example.com';