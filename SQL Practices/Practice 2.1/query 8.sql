
8. Write an SQL query to report the first name, last name, city, 
and state of each person in the Person table. If the address 
of a personId is not present in the Address table, report null 
instead. Return the result table in any order.

create table Persons(
  person_id int auto_increment,
  last_name varchar(256),
  first_name varchar(256),
  primary key(person_id)
);
insert into Persons
values (1,'Parker','Peter'),
       (2,'Adams','Wednesday'),
       (3,'Willsion','Wade');
select * from Persons;

create table Address(
  add_id int auto_increment,
  person_id int,
  city varchar(256),
  state varchar(256),
  primary key(add_id)
);
insert into Address
values (1,1,'Queens','New York'),
       (2,4,'Mumbai','India'),
       (3,3,'Sydney','Australia');
select * from Address;

select p.first_name,p.last_name,a.city,a.state
from Persons p
left join Address a
on p.person_id = a.person_id;
