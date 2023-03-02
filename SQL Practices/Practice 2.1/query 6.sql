6. Write an SQL query to create index on the email column.

create table Users(
   id int auto_increment,
   email varchar(256),
   primary key(id)
);

create index email_index on Users(email);
insert into Users
values (1,'abd17@gmail.com'),
       (2,'vk18@gmail.com'),
       (3,'rp17@gmail.com');
select * from Users;