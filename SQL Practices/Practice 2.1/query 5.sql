-- 5. Write an SQL query to report all customers who never order 
-- anything. Return the result table in any order.

create table Customer(
   id int auto_increment,
   name varchar(256),
   primary key(id)
);
insert into Customer 
values (1,'Geralt of Rivia'),
       (2,'Lucifer Morningstar'),
       (3,'Harry Potter'),
       (4,'Peter Parker');
select * from Customer;

create table Orders(
     id int auto_increment,
     customer_id int,
     primary key (id),
     foreign key (customer_id) references Customer(id) on delete cascade
);
insert into Orders 
values (1,4),
       (2,1),
       (3,2);
select * from Orders;

select name 
from Customer
where id not in (select customer_id from Orders);
