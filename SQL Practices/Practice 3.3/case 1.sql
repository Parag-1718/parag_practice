-- Consider a table called "books" with the following columns: 
-- "id", "title", "author", "publication_year". Write a SQL query 
-- to retrieve the title and author of the oldest book in the 
-- table.


CREATE TABLE books (
  id INT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  publication_year INT NOT NULL
);
INSERT INTO books
VALUES
(1,'Sword of Destiny (Miecz Przeznaczenia)','Andrzej Sapkowski',2015),
(2,'The History of Tom Jones, a Foundling','Henry Fielding',1749),
(3,'The Lady of the Lake (Pani Jeziora)','Andrzej Sapkowski',2017),
(4,'War and Peace','Leo Tolstoy',1869);
SELECT title,author
FROM books
order by publication_year
limit 1;