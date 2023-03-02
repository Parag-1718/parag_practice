-- case 1 :

create table Activity (
    player_id int,
    device_id int,
    event_date date,
    games_played int,
    primary key (player_id, event_date)
);
insert into Activity
values (1,2,'2016-03-01',5),
       (1,2,'2016-05-02',6),
       (2,3,'2017-06-25',1),
       (3,1,'2016-03-02',0),
       (3,4,'2018-07-03',5);
select * from Activity;


-- query - 1 
select player_id,min(event_date)
from Activity
group by player_id;

-- query - 2 
select player_id,min(device_id)
from Activity
group by player_id;

-- query - 3
select player_id,event_date,sum(games_played)