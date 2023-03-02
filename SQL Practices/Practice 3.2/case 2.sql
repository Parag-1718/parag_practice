CREATE TABLE users (
 id INT PRIMARY KEY,
 name VARCHAR(255),
 created_at TIMESTAMP
);

CREATE TABLE posts (
 id INT PRIMARY KEY,
 user_id INT,
 body TEXT,
 created_at TIMESTAMP
);

CREATE TABLE likes (
 id INT PRIMARY KEY,
 user_id INT,
 post_id INT,
 created_at TIMESTAMP
);


INSERT INTO users (id, name, created_at) VALUES
  (1, 'John Smith', '2022-01-01 10:00:00'),
  (2, 'Jane Doe', '2022-01-02 11:00:00'),
  (3, 'Bob Johnson', '2023-01-03 12:00:00'),
  (4, 'Sarah Lee', '2023-01-04 13:00:00'),
  (5, 'David Kim', '2023-01-05 14:00:00'),
  (6, 'Emily Jones', '2022-01-06 15:00:00'),
  (7, 'Michael Chen', '2022-01-07 16:00:00'),
  (8, 'Amanda Lee', '2023-01-08 17:00:00'),
  (9, 'Daniel Kim', '2023-01-09 18:00:00'),
  (10, 'Megan Smith', '2022-01-10 19:00:00');

INSERT INTO posts (id, user_id, body, created_at)
VALUES
  (1, 1, 'This is my first post!', '2022-01-01 10:00:00'),
  (2, 2, 'I had a great weekend!', '2022-01-02 11:00:00'),
  (3, 3, 'I can''t believe it''s already Monday...', '2023-01-03 12:00:00'),
  (4, 4, 'Just finished a great book!', '2023-01-04 13:00:00'),
  (5, 1, 'What''s everyone up to today?', '2022-01-05 14:00:00'),
  (6, 2, 'I love this weather!', '2022-01-06 15:00:00'),
  (7, 3, 'Trying out a new recipe tonight', '2023-01-07 16:00:00'),
  (8, 4, 'I miss traveling...', '2023-01-08 17:00:00'),
  (9, 1, 'Just started a new job!', '2022-01-09 18:00:00'),
  (10, 2, 'I need a vacation...', '2022-01-10 19:00:00'),
  (11, 3, 'Excited for the weekend!', '2023-01-11 20:00:00'),
  (12, 4, 'I can''t stop listening to this song', '2023-01-12 21:00:00');
  
  INSERT INTO likes (id, user_id, post_id, created_at) VALUES
  (1, 1, 1, '2022-02-21 10:00:00'),
  (2, 2, 1, '2022-02-21 11:00:00'),
  (3, 3, 2, '2023-02-21 12:00:00'),
  (4, 4, 3, '2023-02-22 10:00:00'),
  (5, 2, 4, '2022-02-22 11:00:00'),
  (6, 3, 4, '2023-02-22 12:00:00'),
  (7, 5, 4, '2023-02-22 13:00:00'),
  (8, 1, 5, '2022-02-23 10:00:00'),
  (9, 2, 5, '2022-02-23 11:00:00'),
  (10, 3, 5, '2023-02-23 12:00:00'),
  (11, 5, 6, '2023-02-23 13:00:00'),
  (12, 1, 6, '2022-02-24 10:00:00');


-- Write a query to retrieve the name and number of posts for each 
-- user who joined the platform in the year 2022, along with the 
-- total number of likes received for each user's posts.

select u.name,count(p.id) as total_post,count(l.id) as total_likes
from users u
inner join posts p
on u.id = p.user_id
left join likes l
on p.id = l.post_id
where u.created_at between'2022-01-01' and '2022-12-31'
group by u.id
order by total_post desc;
