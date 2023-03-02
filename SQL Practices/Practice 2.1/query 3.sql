-- 3. Write an SQL query to swap all 'f' and 'm' values (i.e., 
-- change all 'f' values to 'm' and vice versa) with a single 
-- update statement and no intermediate temporary tables.Note 
-- that you must write a single update statement, do not write 
-- any select statement for this problem.


CREATE TABLE Salary (
    id INT AUTO_INCREMENT,
    name VARCHAR(256),
    sex ENUM('m', 'f'),
    salary INT,
    PRIMARY KEY (id)
);

INSERT INTO `practice_2.1`.`salary` (`id`, `name`, `sex`, `salary`) 
VALUES ('1', 'AAA', 'm', '2500'),
('2', 'BBB', 'f', '1500'),
('3', 'CCC', 'f', '2600'),
('4', 'DDD', 'm', '3500');

UPDATE Salary 
SET sex = CASE WHEN sex = 'f' THEN 'm'ELSE 'f' END;

SELECT 
    *
FROM
    Salary;
