-- Case 1
-- Assume that you are working with a database containing
-- information about a bookstore. 

CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    publication_date DATE,
    FOREIGN KEY (author_id)
        REFERENCES authors (id)
);
INSERT INTO books VALUES
(1, 'Harry Potter and the Philosopher\'s Stone', 1, '1997-06-26'),
(2, 'The Shining', 2, '1977-01-28'),
(3, 'To Kill a Mockingbird', 3, '1960-07-11'),
(4, 'The Hobbit', 4, '1937-09-21'),
(5, 'Murder on the Orient Express', 5, '1934-01-01'),
(6, 'Harry Potter and the Chamber of Secrets', 1, '1998-07-02'),
(7, 'The Stand', 2, '1978-10-03'),
(8, 'The Lord of the Rings', 4, '1954-07-29'),
(9, 'And Then There Were None', 5, '1939-11-06'),
(10, 'Harry Potter and the Prisoner of Azkaban', 1, '1999-07-08'),
(11, 'The Da Vinci Code', 1, '2003-03-18'),
(12, 'A Thousand Splendid Suns', 2, '2007-05-22'),
(13, 'The Kite Runner', 2, '2003-05-29'),
(14, 'The Girl with the Dragon Tattoo', 3, '2005-08-01'),
(15, 'The Hunger Games', 4, '2008-09-14');

-- authors table containing information about all authors of the 
-- books in the bookstore. The table has the following columns:
-- id: unique identifier for each author
-- name: name of the author

CREATE TABLE authors (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);
INSERT INTO authors VALUES
(1, 'J.K. Rowling'),
(2, 'Stephen King'),
(3, 'Harper Lee'),
(4, 'J.R.R. Tolkien'),
(5, 'Agatha Christie');

-- book_categories table containing information about all 
-- categories of books in the bookstore. The table has the 
-- following columns:
-- id: unique identifier for each category
-- name: name of the category

CREATE TABLE book_categories (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);
INSERT INTO book_categories VALUES
(1, 'Fantasy'),
(2, 'Horror'),
(3, 'Mystery'),
(4, 'Classic'),
(5, 'fiction');

-- book_category_mappings table containing information about which 
-- books belong to which categories. The table has the following 
-- columns:
-- id: unique identifier for each mapping
-- book_id: foreign key pointing to the books table
-- category_id: foreign key pointing to the book_categories table

CREATE TABLE book_category_mappings (
    id INT PRIMARY KEY,
    book_id INT,
    category_id INT,
    FOREIGN KEY (book_id)
        REFERENCES books (id),
    FOREIGN KEY (category_id)
        REFERENCES book_categories (id)
);

INSERT INTO book_category_mappings VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 4),
(4, 4, 1),
(5, 5, 3),
(6, 6, 1),
(7, 7, 2),
(8, 8, 5),
(9, 9, 3),
(10, 10, 5);


-- Write SQL queries to solve the following problems:
-- 1. Write a query to find all books published in the year 2020.

SELECT *
FROM books
WHERE YEAR(publication_date) > 2000;

-- 2. Write a query to find the name of the author who has 
-- written the most number of books.

SELECT authors.name,COUNT(books.author_id) AS written_number_of_book
FROM books
INNER JOIN authors 
ON books.author_id = authors.id
GROUP BY authors.name;

-- 3. Write a query to find the name of the category with the 
-- most number of books.

SELECT bc.name, COUNT(bm.book_id)
FROM book_category_mappings bm
JOIN book_categories bc 
ON bm.category_id = bc.id
GROUP BY bc.id;

-- 4. Write a query to find the name of the author who has 
-- written the most number of books in the category "fiction".

SELECT a.name, COUNT(bm.book_id) AS num_books
FROM authors a
JOIN books b ON a.id = b.author_id
JOIN book_category_mappings bm ON b.id = bm.book_id
JOIN book_categories bc ON bm.category_id = bc.id
WHERE bc.id = 5
GROUP BY b.author_id
ORDER BY num_books DESC;


-- 5. Write a query to find the titles of the top 5 most popular 
-- books. The popularity of a book is defined as the number of 
-- times it has been borrowed by customers. 

-- Assume that 
-- information about book borrowings is stored in a separate 
-- table called book_borrowings with the following columns:
-- id: unique identifier for each borrowing
-- book_id: foreign key pointing to the books table
-- customer_id: foreign key pointing to the customers 
-- table
-- borrow_date: date on which the book was borrowed

CREATE TABLE customers (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
phone VARCHAR(20),
PRIMARY KEY (id)
);

INSERT INTO customers (id,name, email, phone)
VALUES ('1','Jane Smith', 'janesmith@example.com', '555-123-4567')
,('2','John Doe', 'johndoe@example.com', '555-555-5555')
,('3','Bob Johnson', 'bjohnson@example.com', '555-987-6543');


CREATE TABLE book_borrowings (
    id INT NOT NULL AUTO_INCREMENT,
    book_id INT NOT NULL,
    customer_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (book_id)
        REFERENCES books (id),
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
);


INSERT INTO book_borrowings (id, book_id, customer_id, borrow_date)
VALUES
(1, 1, 1, '2022-01-01'),
(2, 2, 1, '2022-02-05'),
(3, 3, 1, '2022-02-14'),
(4, 4, 1, '2022-03-01'),
(5, 5, 2, '2022-03-15'),
(6, 6, 2, '2022-04-02'),
(7, 7, 2, '2022-05-01'),
(8, 8, 3, '2022-05-05'),
(9, 9, 1, '2022-06-01'),
(10, 10, 3, '2022-06-25'),
(11, 1, 2, '2022-01-11'),
(12, 2, 3, '2022-02-08'),
(13, 4, 1, '2022-02-18'),
(14, 7, 2, '2022-03-11'),
(15, 8, 3, '2022-03-20');

-- 5. Write a query to find the titles of the top 5 most popular 
-- books. The popularity of a book is defined as the number of 
-- times it has been borrowed by customers. 

SELECT b.title, COUNT(c.id) AS num_of_cus
FROM books b
JOIN book_borrowings bb ON b.id = bb.book_id
JOIN customers c ON bb.customer_id = c.id
GROUP BY b.id
ORDER BY num_of_cus DESC
LIMIT 5;