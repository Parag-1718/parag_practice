create table Colleges (
c_id int auto_increment,
name varchar(64),
location varchar(64),
primary key (c_id)
);

create table Students (
s_id int auto_increment,
name varchar(64),
email_id varchar(64),
c_id int,
primary key (s_id),
foreign key (c_id) references colleges (c_id) on delete cascade
);