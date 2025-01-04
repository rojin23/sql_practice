create schema writer;
use writer;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    author_id INT,
    genre VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);


CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY,
    membership_date DATE
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
);

INSERT INTO Authors (author_id, author_name, country) VALUES
(1, 'J.K. Rowling', 'UK'),
(2, 'George R.R. Martin', 'USA'),
(3, 'Kass Morgan', 'USA'),
(4, 'Stan Lee', 'USA');

select *  from Authors;

INSERT INTO Books (book_id, title, author_id, genre) VALUES
(1, 'Harry Potter and Philosophers Stone', 1, 'Fantasy'),
(2, 'A Song of Ice and Fire', 2, 'Fantasy'),
(3, 'The Hundred', 3, 'Fantasy'),
(4, 'Marvel', 4, 'Superhero');

INSERT INTO Borrowers (borrower_id, membership_date) VALUES
(1, '2025-01-01'),
(2, '2025-01-02'),
(3, '2025-01-03');

INSERT INTO Transactions (transaction_id, book_id, borrower_id, borrow_date, return_date) VALUES
(1, 1, 1, '2025-01-04', NULL),
(2, 2, 2, '2025-01-05', '2025-01-06'),
(3, 3, 3, '2025-01-06', NULL);

select *  from Transactions;


SELECT Books.title, Authors.author_name
FROM Books
JOIN Authors ON Books.author_id = Authors.author_id;

SELECT Borrowers.borrower_id, Books.title
FROM Transactions
JOIN Borrowers ON Transactions.borrower_id = Borrowers.borrower_id
JOIN Books ON Transactions.book_id = Books.book_id;

SELECT Authors.author_name, Books.title
FROM Authors
LEFT JOIN Books ON Authors.author_id = Books.author_id;