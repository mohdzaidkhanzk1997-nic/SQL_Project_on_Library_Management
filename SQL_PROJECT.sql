-- CREATE TABLE branch 
-- (
-- branch_id	VARCHAR(50),
-- manager_id	VARCHAR(50),
-- branch_address	VARCHAR(50),
-- contact_no VARCHAR(50)

-- );

-- ALTER TABLE branch
-- ADD PRIMARY KEY (branch_id);



-- select * from branch

-- CREATE TABLE employees (
-- emp_id	VARCHAR(20),
-- emp_name VARCHAR(20),
-- position	VARCHAR(20),
-- salary	INT,
-- branch_id VARCHAR(20)

-- )

-- ALTER TABLE employees
-- ADD PRIMARY KEY (emp_id);


-- select * from employees


-- CREATE TABLE books(
-- isbn	VARCHAR(100),
-- book_title	VARCHAR(100),
-- category	VARCHAR(100),
-- rental_price	FLOAT,
-- status	VARCHAR(20),
-- author	VARCHAR(100),
-- publisher VARCHAR(100)

-- )

-- ALTER TABLE books
-- ADD PRIMARY KEY (isbn);

-- select * from books

-- SELECT * FROM books

-- CREATE TABLE members(

-- member_id VARCHAR(50) PRIMARY KEY,
-- member_name VARCHAR(50),
-- member_address VARCHAR(50),
-- reg_date DATE

-- )

-- SELECT * FROM members


-- CREATE TABLE issued_status(
-- issued_id VARCHAR(100) PRIMARY KEY,
-- issued_member_id VARCHAR(100),
-- issued_book_name VARCHAR(100),
-- issued_date DATE,
-- issued_book_isbn VARCHAR(100),
-- issued_emp_id VARCHAR(100)

-- )

-- SELECT * FROM issued_status

-- CREATE TABLE return_status
-- (
-- return_id	VARCHAR(50),
-- issued_id VARCHAR(50),
-- return_book_name VARCHAR(50),
-- return_date DATE,
-- return_book_isbn VARCHAR(50)
-- )

-- SELECT * FROM return_status

-- ALTER TABLE issued_status
-- ADD CONSTRAINT fk_members
-- FOREIGN KEY (issued_member_id)
-- REFERENCES members(member_id)

-- ALTER TABLE issued_status
-- ADD CONSTRAINT fk_books
-- FOREIGN KEY (issued_book_isbn)
-- REFERENCES books(isbn)

-- ALTER TABLE issued_status
-- ADD CONSTRAINT fk_books
-- FOREIGN KEY (issued_book_isbn)
-- REFERENCES books(isbn)

-- ALTER TABLE issued_status
-- ADD CONSTRAINT fk_employees
-- FOREIGN KEY (issued_emp_id)
-- REFERENCES employees(emp_id)


-- ALTER TABLE employees
-- ADD CONSTRAINT fk_branch
-- FOREIGN KEY (branch_id)
-- REFERENCES branch(branch_id)


-- ALTER TABLE return_status
-- ADD CONSTRAINT fk_issued_status
-- FOREIGN KEY (issued_id)
-- REFERENCES issued_status(issued_id);



-- SELECT issued_id
-- FROM return_status
-- WHERE issued_id NOT IN (
--     SELECT issued_id FROM issued_status
-- );

-- DELETE FROM return_status
-- WHERE issued_id = 'IS103'

-- SELECT * FROM return_status



-- select * from books

-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"


-- INSERT INTO books
-- (isbn, book_title, category, rental_price, status, author, publisher)
-- VALUES
-- ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')

-- Task 2: Update an Existing Member's Address

-- UPDATE members
-- SET member_address = '125 Main St'
-- WHERE member_id = 'C101'

-- select * from members
-- order by member_id ASC


-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

-- select * from return_status

-- DELETE FROM issued_status
-- WHERE issued_id = 'IS121'

-- SELECT * FROM issued_status

-- SELECT * FROM books

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'


-- select * from issued_status
-- where issued_emp_id = 'E101'


-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

-- SELECT 
-- issued_emp_id,
-- COUNT(issued_id) 
-- as total_book_issued
-- FROM issued_status
-- GROUP BY issued_emp_id
-- HAVING COUNT(issued_id) > 1


-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt

-- CREATE TABLE book_cnts AS
-- SELECT b.isbn, b.book_title, COUNT(i.issued_book_isbn)

-- FROM books AS b
-- JOIN issued_status AS i
-- ON b.isbn = i.issued_book_isbn
-- GROUP BY 1, 2

-- SELECT * FROM books


-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:

-- SELECT DISTINCT category FROM books


-- SELECT  * FROM books
-- WHERE category = 'History'
-- OR category = 'Classic'


-- Task 8: Find Total Rental Income by Category:

-- SELECT SUM(rental_price), books.category
-- FROM books
-- GROUP BY books.category
-- ORDER BY  SUM(rental_price) DESC

-- Task 9. **List Members Who Registered in the Last 180 Days**:

select * from members
WHERE reg_date >= CURRENT_DATE - INTERVAL '800 days'

-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:

-- SELECT e1.*, e2.emp_name, branch.manager_id AS manager_name FROM employees AS e1
-- JOIN branch
-- ON e1.branch_id = branch.branch_id
-- JOIN employees AS e2 
-- ON branch.manager_id = e2.emp_id

-- select * from employees


-- Task 11. Select Books with Rental Price Above a Certain Threshold of 7USD

-- SELECT * FROM books
-- WHERE rental_price > 7
-- ORDER BY rental_price ASC


-- Task 12: Retrieve the List of Books Not Yet Returned
-- SELECT DISTINCT ist.issued_book_name FROM issued_status  as ist
-- LEFT JOIN return_status as  rst
-- ON ist.issued_id = rst.issued_id
-- WHERE rst.return_id IS NULL


-- ### Advanced SQL Operations

-- SELECT * FROM books
-- SELECT * FROM branch
-- SELECT * FROM employees
-- SELECT * FROM  issued_status
-- SELECT * FROM members
-- SELECT * FROM return_status

-- Task 13: Identify Members with Overdue Books
-- Write a query to identify members who have overdue books (assume a 30-day return period). 
-- Display the member's id, member's name, book title, issue date, and days overdue.

-- SELECT * FROM members

SELECT * FROM  issued_status
SELECT * FROM books
SELECT * FROM return_status
SELECT * FROM members


-- SELECT ist.issued_member_id, m.member_name, books.book_title, ist.issued_date, rs.return_date,
-- CURRENT_DATE - ist.issued_date AS over_due_days
-- FROM issued_status as ist
-- JOIN members as m 
-- ON ist.issued_member_id = m.member_id
-- JOIN books
-- ON ist.issued_book_isbn = books.isbn
-- LEFT JOIN return_status as rs
-- ON rs.issued_id = ist.issued_id
-- WHERE rs.return_date IS NULL

-- ORDER BY 1


-- Task 14: Update Book Status on Return
-- Write a query to update the status of books in the books table to "Yes" when they are returned 
-- (based on entries in the return_status table).

-- select * from issued_status
-- select * from books
-- WHERE isbn = '978-0-451-52994-2'

-- select * from return_status
-- WHERE 
-- issued_id = 'IS130'

-- INSERT INTO return_status
-- (return_id, issued_id, return_book_name, return_date)
-- VALUES
-- ('RS125', 'IS130', 'NULL', CURRENT_DATE )

-- DELETE FROM return_status
-- WHERE return_id = 'RS125'

-- UPDATE return_status
-- SET return_book_isbn = 'NULL'
-- WHERE return_id = 'RS125'

-- Task 15: Branch Performance Report
-- Create a query that generates a performance report for each branch, showing the number of books issued, 
-- the number of books returned, and the total revenue generated from book rentals.


-- select * from branch

-- select * from issued_status

-- select * from employees

-- select * from books

-- select * from return_status


-- CREATE TABLE branch_reports
-- AS
-- select b.branch_id, b.manager_id, COUNT(ist.issued_id) as number_book_issued, COUNT(rst.return_id), SUM(bk.rental_price) as total_revenue
--  from issued_status as ist
-- JOIN employees as e
-- ON e.emp_id = ist.issued_emp_id
-- JOIN branch as b
-- on e.branch_id = b.branch_id
-- JOIN return_status as rst
-- ON rst.issued_id = ist.issued_id
-- JOIN books as bk
-- ON ist.issued_book_isbn = bk.isbn
-- GROUP BY 1, 2


-- SELECT * FROM branch_reports

-- Task 16: CTAS: Create a Table of Active Members
-- Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book
-- in the last 6 months.
-- CREATE TABLE active_members 
-- AS
-- SELECT * FROM members
-- WHERE member_id IN (

-- select DISTINCT issued_member_id
-- from issued_status
-- WHERE issued_date >= CURRENT_DATE - INTERVAL '26 month'
-- )
-- SELECT * FROM active_members




-- Task 17: Find Employees with the Most Book Issues Processed
-- Write a query to find the top 3 employees who have processed the most book issues. 
-- Display the employee name, number of books processed, and their branch.


-- SELECT 
--     e.emp_name,
--     b.*,
--     COUNT(ist.issued_id) as no_book_issued
-- FROM issued_status as ist
-- JOIN
-- employees as e
-- ON e.emp_id = ist.issued_emp_id
-- JOIN
-- branch as b
-- ON e.branch_id = b.branch_id
-- GROUP BY 1, 2











