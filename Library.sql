CREATE DATABASE library;
USE library;

CREATE TABLE Books
(
  ISBN VARCHAR(25) PRIMARY KEY,
  Book_title VARCHAR(80),
  Category VARCHAR(30),
  Rental_Price DECIMAL(10,2),
  Status ENUM('Yes','No'),
  Author VARCHAR(30),
  Publisher VARCHAR(30)
);

CREATE TABLE Branch
(
  Branch_no VARCHAR(10) PRIMARY KEY,
  Manager_id VARCHAR(10),
  Branch_address VARCHAR(30),
  Contact_no VARCHAR(15)
);

CREATE TABLE Employee
(
  Emp_id VARCHAR(10) PRIMARY KEY,
  Emp_name VARCHAR(30),
  Position VARCHAR(30),
  Salary DECIMAL(10,2)
);

CREATE TABLE Customer
(
  Customer_Id VARCHAR(10) PRIMARY KEY,
  Customer_name VARCHAR(30),
  Customer_address VARCHAR(30),
  Reg_date DATE
);

CREATE TABLE IssueStatus
(
  Issue_Id VARCHAR(10) PRIMARY KEY,
  Issued_cust VARCHAR(10),
  Issued_book_name VARCHAR(80),
  Issue_date DATE,
  Isbn_book VARCHAR(25),
  FOREIGN KEY (Issued_cust) REFERENCES customer(Customer_id) ON DELETE CASCADE,
  FOREIGN KEY (Isbn_book) REFERENCES books(ISBN) ON DELETE CASCADE
);

CREATE TABLE ReturnStatus
(
  Return_id VARCHAR(10) PRIMARY KEY,
  Return_cust VARCHAR(10),
  Return_book_name VARCHAR(80),
  Return_date DATE,
  isbn_book2 VARCHAR(25),
  FOREIGN KEY (isbn_book2) REFERENCES books(ISBN) ON DELETE CASCADE
);

INSERT INTO branch VALUES
('BR001', 'MG101', '123 Amritsar Rd, Punjab', '0987654321'),
('BR002', 'MG102', '456 Ludhiana Rd, Punjab', '0987654322'),
('BR003', 'MG103', '789 Jalandhar Rd, Punjab', '0987654323'),
('BR004', 'MG104', '567 Patiala Rd, Punjab', '0987654324'),
('BR005', 'MG105', '890 Chandigarh Rd, Punjab', '0987654325');

INSERT INTO employee VALUES
('E101', 'Ram Sharma', 'Manager', 60000.00),
('E102', 'Mohan Singh', 'Clerk', 45000.00),
('E103', 'Shyam Verma', 'Librarian', 55000.00),
('E104', 'Ravi Gupta', 'Assistant', 40000.00),
('E105', 'Sita Yadav', 'Assistant', 42000.00),
('E106', 'Rahul Patel', 'Assistant', 43000.00),
('E107', 'Anil Mehra', 'Manager', 62000.00),
('E108', 'Gita Reddy', 'Clerk', 46000.00),
('E109', 'Rakesh Deshmukh', 'Librarian', 57000.00),
('E110', 'Vijay Pandey', 'Assistant', 41000.00),
('E111', 'Amit Kumar', 'Manager', 65000.00);

INSERT INTO customer VALUES
('C101', 'Rajesh Kumar', '123 Amritsar Rd', '2021-05-15'),
('C102', 'Priya Singh', '456 Ludhiana Rd', '2021-06-20'),
('C103', 'Amitabh Gupta', '789 Jalandhar Rd', '2021-07-10'),
('C104', 'Neha Rani', '567 Patiala Rd', '2021-08-05'),
('C105', 'Karan Malhotra', '890 Chandigarh Rd', '2021-09-25'),
('C106', 'Sunita Yadav', '234 Mohali Rd', '2021-10-15'),
('C107', 'Vikas Reddy', '345 Bathinda Rd', '2021-11-20'),
('C108', 'Pooja Deshmukh', '456 Zirakpur Rd', '2021-12-10'),
('C109', 'Meera Pandey', '567 Phagwara Rd', '2022-01-05'),
('C110', 'Nikhil Mehra', '678 Hoshiarpur Rd', '2022-02-25');

INSERT INTO books VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', "Harry Potter and the Sorcerer's Stone", 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-009-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', "A People's History of the United States", 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'yes', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'yes', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'yes', 'Charles C. Mann', 'Vintage Books');

UPDATE books SET status = 'No' WHERE isbn in ('978-0-307-58837-1','978-0-141-44171-6','978-0-7432-7357-1');

INSERT INTO IssueStatus VALUES
('IS101', 'C101', 'The Catcher in the Rye', '2023-08-01', '978-0-553-29698-2'),
('IS102', 'C102', 'The Da Vinci Code', '2023-08-02', '978-0-7432-4722-4'),
('IS103', 'C103', '1491: New Revelations of the Americas Before Columbus', '2023-08-03', '978-0-7432-7357-1'),
('IS104', 'C104', 'Sapiens: A Brief History of Humankind', '2023-08-04', '978-0-307-58837-1'),
('IS105', 'C105', 'The Diary of a Young Girl', '2023-08-05', '978-0-375-41398-8');

INSERT INTO ReturnStatus VALUES
('RS101', 'C101', 'The Catcher in the Rye', '2023-09-01', '978-0-553-29698-2'),
('RS102', 'C102', 'The Da Vinci Code', '2023-09-02', '978-0-7432-4722-4'),
('RS103', 'C105', 'The Diary of a Young Girl', '2023-09-03', '978-0-375-41398-8'),
('RS104', 'C108', 'The Histories', '2023-09-04', '978-0-14-044930-3'),
('RS105', 'C110', 'A Game of Thrones', '2023-09-05', '978-0-009-957807-9');



SELECT * FROM Books;

SELECT Customer_name, Customer_address FROM Customer;

SELECT Emp_name, Salary FROM Employee WHERE Salary > 50000;

SELECT Book_title FROM Books WHERE Status = 'Yes';

SELECT Customer.Customer_name, IssueStatus.Issued_book_name 
FROM Customer 
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust;

SELECT Book_title, Rental_Price FROM Books WHERE Rental_Price > 7.00;

SELECT Emp_name, Position FROM Employee WHERE Position = 'Manager';


SELECT Return_book_name, Return_date FROM ReturnStatus WHERE Return_date > '2023-09-02';

SELECT Branch.Branch_no, Branch.Branch_address, Employee.Emp_name AS Manager 
FROM Branch 
JOIN Employee ON Branch.Manager_id = Employee.Emp_id;

SELECT Issued_book_name, Issue_date 
FROM IssueStatus 
WHERE Issued_cust = 'C101';

