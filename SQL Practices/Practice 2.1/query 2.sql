-- 2. Write an SQL query to report the movies with an odd-numbered 
-- ID and a description that is not "boring". Return the result 
-- table ordered by rating in descending order.


CREATE TABLE Cinema (
    id INT AUTO_INCREMENT,
    movie VARCHAR(256),
    description VARCHAR(256),
    rating FLOAT(4),
    PRIMARY KEY (id)
);

INSERT INTO `practice_2.1`.`cinema` (`id`, `movie`, `description`, `rating`) 
VALUES ('1', 'Avengers', 'great 3D', '9.5'),
('2', 'Avtar', 'great 3D', '9.2'),
('3', 'Iron Man', 'good', '8.5'),
('4', 'Thor : Love & Thunder', 'boaring', '6.5'),
('5', 'KGF', 'boaring', '6.8');

SELECT 
    *
FROM
    Cinema
WHERE
    (id % 2 = 1) AND (description not in ('boaring'))
ORDER BY rating DESC;


