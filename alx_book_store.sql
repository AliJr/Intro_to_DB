-- Drop the database if it exists and create a new one
DROP DATABASE IF EXISTS `alx_book_store`;
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE `alx_book_store`;



-- Create the Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215)
);

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215) UNIQUE,
    address TEXT
);

-- Create the Books table with the correct foreign key
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id)
        REFERENCES Authors (author_id)
);

-- Create the Orders table with the correct foreign key
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Order_Details table with the correct foreign keys
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id),
    FOREIGN KEY (book_id)
        REFERENCES Books (book_id)
);