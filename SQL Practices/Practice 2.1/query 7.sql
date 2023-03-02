-- 7. Create a database schema for student grade system. It contains 
-- student data and their grade of each subject based on the 
-- different semester.


create table Students(
    id int auto_increment,
    first_name varchar(256) not null,
	last_name varchar(256) not null,
    email varchar(256),
    primary key(id)
);
insert into Students
values (1,'john','wick','johnwk34@gmail.com'),
	   (2,'matt','mardock','mattdock66@gmail.com');
select * from Students;

create table Subjects(
    id int auto_increment,
    sub_name varchar(256) not null,
    primary key(id)
);
insert into Subjects
values (1,'maths'),
	   (2,'science');
select * from Subjects;

create table Semesters(
    id int auto_increment,
    sem_name varchar(256) not null,
    primary key(id)
);
insert into Semesters
values (1,'1st semester'),
	   (2,'2nd semester');
select * from Semesters;

create table Grades(
    id int auto_increment,
	sut_id int,
    sub_id int,
    sem_id int,
    grade float,
    primary key(id),
    foreign key(sut_id) references Students(id) on delete cascade,
    foreign key(sub_id) references Subjects(id) on delete cascade,
    foreign key(sem_id) references Semesters(id) on delete cascade
);
insert into Grades
values (1,1,1,1,3.6),
       (2,1,2,1,3.8),
       (3,1,1,2,3.9),
       (4,1,2,2,4.2),
       (5,2,1,1,3.9),
       (6,2,2,1,4.3),
       (7,2,1,2,3.3),
       (8,2,2,2,4.6);
select * from Grades;
