# (SQL)
(Welcome to my SQL project repository  ,I have worked on various data management and analysis task using SQL) one example 
# Projectlink
(https://github.com/rojin23/sql_practice/blob/main/(Sql)%20full%20data%20coding%20of%20author%2Cbooks%2Cplace.%20and%20many%20more.sql
# Library Database Schema

This project involves creating a relational database schema for a library system. The schema includes tables for Authors, Books, Borrowers, and Transactions. The following steps were performed:
## 1. Schema Creation:
A schema named Library was created to group all the related tables.

## 2. Table Creation:
- *Authors Table*: Stores information about authors, including author_id, author_name, and country.
- *Books Table*: Stores details about books, including book_id, title, author_id, and genre.
- *Borrowers Table*: Contains information about library members, including borrower_id, borrower_name, and membership_date.
- *Transactions Table*: Tracks book borrowings and returns, including transaction_id, book_id, borrower_id, borrow_date, and return_date.

## 3. Data Insertion:
Sample data was inserted into the tables to demonstrate the system's functionality.

## 4. Query:
A SQL query was written to list all books with their corresponding author names:

```sql
SELECT 
    Books.title AS Book_Title,
    Authors.author_name AS Author_Name
FROM 
    Library.Books
JOIN 
    Library.Authors
ON 
    Books.author_id = Authors.author_id;
