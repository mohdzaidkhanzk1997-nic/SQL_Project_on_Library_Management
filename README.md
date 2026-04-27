# Library Management System using SQL Project --P2

# Project Overview
**Project Title**: Library Management System

**Level:** Intermediate

**Database**: library_db

This project demonstrates the implementation of a Library Management System using SQL. It includes creating and managing tables, 
performing CRUD operations, and executing advanced SQL queries. The goal is to showcase skills in database design, manipulation, and querying.

<img width="1200" height="700" alt="Library manag" src="https://github.com/user-attachments/assets/14c2f459-dd08-45db-99ab-1acd3aefbd39" />

# Objectives

**1. Set up the Library Management System Database** : Create and populate the database with tables for branches, employees, members, books, issued status, and return status.

**2. CRUD Operations:** Perform Create, Read, Update, and Delete operations on the data.

**3. CTAS (Create Table As Select):** Utilize CTAS to create new tables based on query results.

**4. Advanced SQL Queries**: Develop complex queries to analyze and retrieve specific data.

# Project Structure

**1. Database Setup**
<img width="490" height="410" alt="DB" src="https://github.com/user-attachments/assets/7bb6beba-fa9b-4795-8016-ddad749a6f39" />

**1. Database Creation:** Created a database named library_db.

**2. Table Creation** :Created tables for branches, employees, members, books, issued status, and return status. Each table includes relevant columns and relationships.

```sql

CREATE DATABASE library_db;

 CREATE TABLE branch 
 (
 branch_id	VARCHAR(50),
 manager_id	VARCHAR(50),
 branch_address	VARCHAR(50),
 contact_no VARCHAR(50)

 );

ALTER TABLE branch
ADD PRIMARY KEY (branch_id);

 select * from branch

CREATE TABLE employees (
emp_id	VARCHAR(20),
emp_name VARCHAR(20),
position	VARCHAR(20),
salary	INT,
branch_id VARCHAR(20)

)

 ALTER TABLE employees
ADD PRIMARY KEY (emp_id);


select * from employees

CREATE TABLE books(
isbn	VARCHAR(100),
book_title	VARCHAR(100),
category	VARCHAR(100),
rental_price	FLOAT,
status	VARCHAR(20),
author	VARCHAR(100),
publisher VARCHAR(100)

)

ALTER TABLE books
ADD PRIMARY KEY (isbn);

select * from books

SELECT * FROM books

CREATE TABLE members(

member_id VARCHAR(50) PRIMARY KEY,
member_name VARCHAR(50),
member_address VARCHAR(50),
reg_date DATE

)

SELECT * FROM members


CREATE TABLE issued_status(
issued_id VARCHAR(100) PRIMARY KEY,
issued_member_id VARCHAR(100),
issued_book_name VARCHAR(100),
issued_date DATE,
issued_book_isbn VARCHAR(100),
issued_emp_id VARCHAR(100)

)

 SELECT * FROM issued_status

 CREATE TABLE return_status
 (
 return_id	VARCHAR(50),
 issued_id VARCHAR(50),
 return_book_name VARCHAR(50),
 return_date DATE,
 return_book_isbn VARCHAR(50)
 )

 SELECT * FROM return_status











