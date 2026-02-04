drop  database if exists library_management;
create database library_management;
use library_management;
create table books (
isbn varchar(25),
book_title	varchar(150),
category varchar(250),
rental_price float,
status	varchar(18),
author varchar(150),
publisher varchar(500)
);


create table branch(
branch_id varchar(15),
manager_id	varchar(15),
branch_address	varchar(55),
contact_no varchar(10)
);


create table emp(
emp_id	varchar(5),
emp_name varchar(20),
position varchar(20),
salary	int,
branch_id varchar(5) -- fk
);

create table members(
member_id varchar(10) primary key, 
member_name	varchar(25),
member_address varchar(150),
reg_date date
);

create table issue(
issued_id varchar(10) primary key,	
issued_member_id varchar(10), -- fk
issued_book_name varchar (150),
issued_date	date,
issued_book_isbn varchar(150), -- ky
issued_emp_id varchar(10) -- ky
);

create table return_status(
return_id varchar(10) primary key,
issued_id varchar (100),
return_book_name varchar(100),
return_date date,	
return_book_isbn varchar(50)
);

alter table issue
add constraint fk_member
foreign key (issued_member_id)
references members(member_id);

alter table issue 
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table emp
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id)