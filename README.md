# library-management-system-SQL
A Library Management System database project built using MySQL, demonstrating relational data modeling, table relationships, and real-world SQL queries.
Library Management System – SQL Project
 Overview

The Library Management System is a relational database project developed using MySQL to efficiently manage library operations such as book inventory, member records, book issuance, returns, and employee transactions.

This project demonstrates practical knowledge of SQL, database design, normalization, and multi-table relationships, reflecting a real-world database application.

 Project Objectives

Design a normalized relational database for a library

Maintain structured records of books, members, and employees

Track issued and returned books accurately

Ensure data integrity using primary and foreign keys

Practice complex SQL queries using real-life scenarios

 Technologies Used

Database: MySQL

Query Language: SQL

Tool: MySQL Workbench

 Database Structure
Tables Included

books – Stores book details and availability status

members – Stores registered library members

employees – Stores library staff information

issued_books – Tracks issued book transactions

return_books – Tracks returned books and fine details

Each table is connected using foreign key constraints to maintain relational integrity.

 Entity Relationships

One member can issue multiple books

One book can be issued multiple times

One employee can manage multiple issue transactions

Issued and returned books are linked through transaction IDs

 SQL Features & Queries

This project includes:

CRUD operations (Create, Read, Update, Delete)

Multi-table joins (INNER JOIN, LEFT JOIN)

Aggregation using GROUP BY and HAVING

Filtering using WHERE

Constraints (PRIMARY KEY, FOREIGN KEY)

Transaction-level reporting queries


-- Drop and create database
DROP DATABASE IF EXISTS library_management;
CREATE DATABASE library_management;
USE library_management;

CREATE TABLE books (
    isbn VARCHAR(25) PRIMARY KEY,
    book_title VARCHAR(150),
    category VARCHAR(250),
    rental_price FLOAT,
    status VARCHAR(18),
    author VARCHAR(150),
    publisher VARCHAR(500)
);


CREATE TABLE branch (
    branch_id VARCHAR(15) PRIMARY KEY,
    manager_id VARCHAR(15),
    branch_address VARCHAR(55),
    contact_no VARCHAR(10)
);


CREATE TABLE emp (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(20),
    position VARCHAR(20),
    salary INT,
    branch_id VARCHAR(15)
);


CREATE TABLE members (
    member_id VARCHAR(10) PRIMARY KEY, 
    member_name VARCHAR(25),
    member_address VARCHAR(150),
    reg_date DATE
);


CREATE TABLE issue (
    issued_id VARCHAR(10) PRIMARY KEY,	
    issued_member_id VARCHAR(10),
    issued_book_name VARCHAR(150),
    issued_date DATE,
    issued_book_isbn VARCHAR(25),
    issued_emp_id VARCHAR(10)
);


CREATE TABLE return_status (
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(10),
    return_book_name VARCHAR(100),
    return_date DATE,	
    return_book_isbn VARCHAR(25)
);


-- Issue → Members
ALTER TABLE issue
ADD CONSTRAINT fk_member
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

-- Issue → Books
ALTER TABLE issue
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

-- Issue → Employees
ALTER TABLE issue
ADD CONSTRAINT fk_emp
FOREIGN KEY (issued_emp_id)
REFERENCES emp(emp_id);

-- Employee → Branch   (this is the one you asked to add)
ALTER TABLE emp
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

-- Return → Issue
ALTER TABLE return_status
ADD CONSTRAINT fk_issue
FOREIGN KEY (issued_id)
REFERENCES issue(issued_id);

-- Return → Books
ALTER TABLE return_status
ADD CONSTRAINT fk_return_book
FOREIGN KEY (return_book_isbn)
REFERENCES books(isbn);

