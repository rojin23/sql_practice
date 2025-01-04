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

INSERT INTO Authors VALUES
(1, 'J.K. Rowling', 'UK'),
(2, 'George R.R. Martin', 'USA'),
(3, 'J.R.R. Tolkien', 'UK'),
(4, 'Jane Austen', 'UK');

select * from Authors;

INSERT INTO Books VALUES
(1, 'Harry Potter and the Philosopher\'s Stone', 1, 'Fantasy'),
(2, 'A Game of Thrones', 2, 'Fantasy'),
(3, 'The Hobbit', 3, 'Fantasy');

INSERT INTO Borrowers VALUES
(1, '2025-01-01'),
(2, '2025-01-02');

select * from Borrowers;

INSERT INTO Transactions VALUES
(1, 1, 1, '2025-01-03', NULL),
(2, 2, 2, '2025-01-03', '2025-01-04');

select * from Transactions;

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
