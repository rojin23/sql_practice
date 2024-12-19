create schema books;
use books;

create table Authors(
author_id int primary key,
author_name varchar(50),
country varchar (50)
);

create table Books(
book_id int primary key,
titles varchar (50),
genre varchar (50),
author_id int,
foreign key (author_id) references Authors(author_id)
);

CREATE TABLE Borrowers ( 
borrower_id INT PRIMARY KEY, 
borrower_name VARCHAR(50),
 membership_date DATE 
 );
 
create table Transaction (
transaction_id int primary key,
book_id int,
borrower_id int,
borrow_date date,
return_date date,
foreign key ( book_id) references Books(book_id),
foreign key ( borrower_id) references Borrowers(borrower_id)
);

insert into Authors ( author_id,author_name,country) values 
(1,'Author One','USA'),
(2,'Author Two','UK'),
(3,'Author Three','Canada');

insert into Books (book_id,title,author_id,genre) values 
(1,'Book One',1,'Comedy'),
(2,'Book Two',2,'Thriller'),
(3,'Book Three',3,'Mystery');

SELECT * FROM Books;


insert into Borrowers (borrower_id,borrower_name,membership_date) values
(1,'Borrower One','2022-02-02'),
(2,'Borrower Two','2022-04-15'),
(3,'Borrower Three','2022-07-25');

SELECT * FROM Borrowers;


insert into Transactions (transaction_id,book_id,borrower_id,borrow_date,return_date) values
(1,1,1,'2022-02-02','2023-02-02'),
(2,2,2,'2022-04-15','2022-10-15'),
(3,3,3,'2022-07-25','2022-08-25');

SELECT * FROM Transactions;


select a.author_name from Authors a left join Books b On a.author_id=b.author_id
left join Transaction t On b.book_id=t.book_id
where t.transaction_id is Null;

SELECT b.title AS book_title,
COUNT(DISTINCT t.borrower_id) AS unique_borrowers
FROM Books b
LEFT JOIN Transactions t ON b.book_id = t.book_id
GROUP BY b.book_id, b.title;

SELECT br.borrower_id, br.borrower_name,
COUNT(DISTINCT b.author_id) AS unique_authors
FROM Borrowers br
JOIN Transactions t ON br.borrower_id = t.borrower_id
JOIN Books b ON t.book_id = b.book_id
GROUP BY br.borrower_id, br.borrower_name
HAVING COUNT(DISTINCT b.author_id) >= 3;

