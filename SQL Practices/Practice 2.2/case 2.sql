 create table Courses(
       student varchar(256),
       class varchar(256)
 );
 insert into Courses
 values ('A','Maths'),
		('B','Maths'),
        ('C','Science'),
        ('D','English'),
        ('F','Maths'),
        ('G','Maths'),
        ('H','English'),
        ('I','Maths');
select * from Courses;
       
select class
from Courses
group by class
having count(student)>=5;