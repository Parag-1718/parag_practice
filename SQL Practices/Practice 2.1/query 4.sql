-- 4. Write an SQL query to delete all the duplicate emails, keeping 
-- only one unique email with the smallest id. Return the result 
-- table in any order.

CREATE TABLE Person (
    id INT AUTO_INCREMENT,
    email VARCHAR(256),
    PRIMARY KEY (id)
);

INSERT INTO Person 
VALUES(1,'abd123@gmail.com'),
      (2,'john3@gmail.com'),
      (3,'abd123@gmail.com'),
      (4,'johnkras13@gmail.com');
      
SELECT * FROM Person;

DELETE FROM Person
WHERE id NOT IN ( SELECT min(id) FROM Person GROUP BY email);

SELECT * FROM Person;