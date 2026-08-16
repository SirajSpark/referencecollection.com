-- --------------------------------------------------------------------------------
-- MySQL Reference and Guide
-- 
-- ReferenceCollection.com
-- Licensed under the MIT License
-- --------------------------------------------------------------------------------

-- Table of Contents
--------------------
-- 1.  Introduction
-- 2.  Basic Syntax
-- 3.  Data Types
-- 4.  Database Operations
-- 5.  Table Operations
-- 6.  Constraints
-- 7.  Data Manipulation
-- 8.  Querying Data 
-- 9.  Joins
-- 10. Aggregate Functions
-- 11. Subqueries
-- 12. Indexes
-- 13. Stored Procedures
-- 14. Transactions
-- 15. Views
-- 16. Triggers
-- 17. User Management
-- 18. Backup and Restore
-- 19. Locking
-- 20. Replication
-- 21. Partitioning

-- --------------------------------------------------------------------------------
-- 1. Introduction
-- --------------------------------------------------------------------------------

-- Overview
-----------
-- MySQL is an open-source relational database management system (RDBMS).
-- It uses SQL (Structured Query Language) for database operations.
-- MySQL is widely used for web applications and provides high performance,
-- scalability, and ease of use.

-- History
----------
-- MySQL was originally developed in 1994, It was acquired by Sun Microsystems 
-- in 2008, which was then acquired by Oracle Corporation in 2010. 
-- MySQL continues to be developed and maintained by Oracle.

-- Architecture
---------------
-- MySQL operates in a client-server architecture. The server manages databases 
-- by handling actions such as creating, reading, updating, and deleting data. 
-- While the client allows users to interact with the server using SQL commands.
 
-- Components
-------------
-- Databases: Each database is a collection of related tables.
-- Tables: Structures within a database that hold data in rows and columns.
-- Rows: Individual records in a table.
-- Columns: Fields within a table that define the type of data stored.

-- SQL Commands
---------------
-- SQL commands are divided into several categories:
-- Data Definition Language (DDL): CREATE, ALTER, DROP, TRUNCATE
-- Data Manipulation Language (DML): SELECT, INSERT, UPDATE, DELETE
-- Data Control Language (DCL): GRANT, REVOKE
-- Transaction Control Language (TCL): COMMIT, ROLLBACK, SAVEPOINT

-- --------------------------------------------------------------------------------
-- 2. Basic Syntax
-- --------------------------------------------------------------------------------

-- Comments
-----------
-- There are two types of comments: single-line and multi-line.

-- Single-line comment
# Another single-line comment
/* Multi-line comment */

-- Semicolons
-------------
-- Each SQL statement should end with a semicolon.

SELECT 'Hello, MySQL';

-- Case Sensitivity
-------------------
-- SQL keywords, column names are case-insensitive 
-- Database and table names are case-sensitive

CREATE DATABASE ExampleDB;
CREATE DATABASE exampledb; -- This will create a different database

-- --------------------------------------------------------------------------------
-- 3. Data Types
-- --------------------------------------------------------------------------------
-- MySQL supports various data types.

-- Numeric Types
INT           -- Whole numbers
DECIMAL(M,D)  -- Exact numeric decimal values
FLOAT         -- Approximate numeric values

-- String Types
CHAR(M)       -- Fixed-length strings
VARCHAR(M)    -- Variable-length strings
TEXT          -- Large amount of text data

-- Date and Time Types
DATE          -- Date values (YYYY-MM-DD)
TIME          -- Time values (HH:MM:SS)
DATETIME      -- Date and time combination

-- Other Types
BOOLEAN       -- True or false values
ENUM          -- String object with a value chosen from a list
JSON          -- Stores and enables efficient access to JSON

-- --------------------------------------------------------------------------------
-- 4. Database Operations
-- --------------------------------------------------------------------------------
-- In MySQL, data is organized into databases, which contain tables.

-- Listing databases
SHOW DATABASES;

-- Creating a database
CREATE DATABASE IF NOT EXISTS my_database;

-- Dropping a database
DROP DATABASE IF EXISTS my_database;

-- Selecting a database
USE my_database;

-- --------------------------------------------------------------------------------
-- 5. Table Operations
-- --------------------------------------------------------------------------------
-- Tables are composed of columns (fields) and rows (records).
-- Syntax: <column> <datatype> <constraints>

-- Creating a table
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(8, 2) NOT NULL,
    stock_quantity INT,
    created_at DATE
);

-- Altering a table (add, modify, drop)
ALTER TABLE products ADD COLUMN discount DECIMAL(5, 2);
ALTER TABLE products MODIFY COLUMN discount DECIMAL(6, 2);
ALTER TABLE products DROP COLUMN discount;

-- Dropping a table
DROP TABLE products;

-- --------------------------------------------------------------------------------
-- 6. Constraints
-- --------------------------------------------------------------------------------
-- MySQL constraints are used to specify rules for the data in a table. 
-- They ensure the integrity of data in the database.
--
-- Common MySQL constraints:
-- * AUTO_INCREMENT: Generates a unique sequential value for a column.
-- * PRIMARY KEY: Uniquely identifies each row in a table.
-- * FOREIGN KEY: Establishes a link between two tables.
-- * UNIQUE: Ensures all values in a column are distinct.
-- * NOT NULL: Ensures a column cannot have NULL values.
-- * CHECK: Ensures that all column values satisfy a specific condition.
-- * DEFAULT: Provides a default value, if no value is specified.

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,         -- PRIMARY KEY constraint
    product_id INT UNIQUE,                           -- UNIQUE constraint
    customer_name VARCHAR(100) NOT NULL,             -- NOT NULL constraint
    order_date DATE NOT NULL,                        -- NOT NULL constraint
    quantity INT CHECK (quantity >= 1),              -- CHECK constraint
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- DEFAULT constraint
    FOREIGN KEY (product_id) REFERENCES products(id) -- FOREIGN KEY constraint
);

-- Adding a CHECK constraint
ALTER TABLE orders ADD CONSTRAINT chk_valid_order CHECK (order_date <= CURRENT_DATE);

-- --------------------------------------------------------------------------------
-- 7. Data Manipulation
-- --------------------------------------------------------------------------------
-- Inserting/Updating data in your tables.

-- You can insert either a single row or multiple rows
INSERT INTO products (product_name, category, price, stock_quantity, created_at)
VALUES
    ('Laptop', 'Electronics', 999.99, 50, '2023-01-15'),
    ('Smartphone', 'Electronics', 799.99, 150, '2023-02-01'),
    ('Desk Chair', 'Furniture', 199.99, 75, '2023-03-10');

-- Updating the price of a specific product based on its ID.
UPDATE products SET price = 879.99 WHERE id = 2;

-- Deleting a specific product from the table based on its ID.
DELETE FROM products WHERE id = 3;

-- --------------------------------------------------------------------------------
-- 8. Querying Data
-- --------------------------------------------------------------------------------
-- Retrieving data from your tables.

-- Retrieve all columns for each product in table
SELECT * FROM products;

-- Retrieve only specific columns for each product in table
SELECT product_name, price, stock_quantity FROM products;

-- Retrieve all products with a price greater than 500
SELECT * FROM products WHERE price > 500;

-- Results can be ordered: ascending (ASC) or descending (DESC)
SELECT * FROM products ORDER BY created_at DESC;

-- Retrieve the first 10 products with their names and prices
SELECT product_name, price FROM products LIMIT 10;

-- --------------------------------------------------------------------------------
-- 9. Joins
-- --------------------------------------------------------------------------------
-- Joins are crucial for querying data spread across multiple tables.
-- They are used to combine rows from two or more tables based 
-- on a related column between them.
--
-- Main types of MySQL joins:
-- * INNER JOIN: Returns rows with matching values in both tables.
-- * LEFT JOIN : Returns all rows from the left table, and matching 
--               rows from the right table. unmatched right rows are NULL.
-- * RIGHT JOIN: Returns all rows from the right table, and matching 
--               rows from the left table. unmatched left rows are NULL.
-- * CROSS JOIN: Returns the Cartesian product of two tables, showing all 
--               possible row combinations.
-- * SELF JOIN : Joins a table with itself to compare same table rows.

-- INNER JOIN: Retrieve the order details and product name for all orders
SELECT orders.order_id, products.product_name, orders.customer_name, orders.quantity, orders.order_date
FROM orders
INNER JOIN products ON orders.product_id = products.id;

-- LEFT JOIN: Retrieve all products with their order (if available, else NULL)
SELECT products.product_name, orders.order_id, orders.customer_name, orders.quantity, orders.order_date
FROM products
LEFT JOIN orders ON products.id = orders.product_id;

-- RIGHT JOIN: Retrieve all orders with their product (if available, else NULL)
SELECT products.product_name, orders.order_id, orders.customer_name, orders.quantity, orders.order_date
FROM products
RIGHT JOIN orders ON products.id = orders.product_id;

-- --------------------------------------------------------------------------------
-- 10. Aggregate Functions
-- --------------------------------------------------------------------------------
-- Used to perform calculations on a set of values and return a single value.
-- Often used with the GROUP BY clause to group rows that have the same values.
--
-- Some common MySQL aggregate functions:
-- * COUNT(): Returns the number of rows in a set.
-- * SUM(): Returns the sum of a numeric column.
-- * AVG(): Returns the average value of a numeric column.
-- * MIN(): Returns the minimum value of a column.
-- * MAX(): Returns the maximum value of a column.

-- Get the total number of orders
SELECT COUNT(*) AS total_orders FROM orders;

-- Get the total amount of all orders
SELECT SUM(amount) AS total_amount FROM orders;

-- Get the average order amount
SELECT AVG(amount) AS average_amount FROM orders;

-- Get the number of orders per customer
SELECT customer_id, COUNT(*) AS orders_per_customer
FROM orders
GROUP BY customer_id;

-- Get the total amount spent by each customer
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- --------------------------------------------------------------------------------
-- 11. Subqueries
-- --------------------------------------------------------------------------------
-- A Subquery is a query nested inside another query. They are useful for 
-- breaking down complex queries and can be used in SELECT, WHERE, HAVING, 
-- FROM, and EXISTS clauses.
-- 
-- Types of Subqueries:
-- * Scalar: Returns a single value.
-- * Row: Returns a single row with multiple columns.
-- * Table: Returns multiple rows and columns.
-- * Correlated: References columns from the outer query.

-- Scalar: Retrieves the name of the most expensive product.
SELECT product_name
FROM products
WHERE price = (
    SELECT MAX(price)
    FROM products
);

-- Row: Retrieve products with the highest price in each category.
SELECT id, product_name, price
FROM products
WHERE (category, price) = (
    SELECT category, MAX(price)
    FROM products
    GROUP BY category
);

-- Table: Retrieves products that have been ordered more than 10 times.
SELECT product_name
FROM products
WHERE id IN (
    SELECT product_id
    FROM Orders
    GROUP BY product_id
    HAVING SUM(quantity) > 10
);

-- Correlated: Products with orders in the Last 30 Days
SELECT p.product_name
FROM products p
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.product_id = p.id
    AND o.order_date > CURDATE() - INTERVAL 30 DAY
);
-- --------------------------------------------------------------------------------
-- 12. Indexes
-- --------------------------------------------------------------------------------
-- Improve query performance by speeding up data retrieval. But may slow 
-- down data modification operations such as INSERT, UPDATE, and DELETE.
--
-- Some common MySQL indexes:
-- * INDEX: Speeds up retrieval but doesn't enforce uniqueness.
-- * PRIMARY KEY: Uniquely identifies each row and creates a unique index.
-- * UNIQUE: Ensures distinct values and creates a unique index.
-- * FULLTEXT: For full-text searches.
-- * SPATIAL: For spatial data types.
-- * COMPOSITE: Useful for queries that involve multiple columns.

-- Create an index on the price column.
CREATE INDEX idx_price ON Products (price);

-- Create a full-text index on the description column.
CREATE FULLTEXT INDEX idx_description ON Products (description);

-- Create a composite index on category and price columns.
CREATE INDEX idx_category_price ON Products (category, price);

-- Drop the full-text index on the description column.
DROP INDEX idx_description ON Products;

-- --------------------------------------------------------------------------------
-- 13. Stored Procedures
-- --------------------------------------------------------------------------------
-- A set of SQL statements that can be stored in the database and executed 
-- repeatedly. They improve performance by reducing client-server communication.
--
-- Key points:
-- * DELIMITER: Changes the delimiter to allow for multi-line statements.
-- * CREATE PROCEDURE: Used to create a new procedure.
-- * BEGIN and END: Enclose the SQL statements of the procedure.

-- A Procedure that retrieves all orders placed by a specific customer.
DELIMITER $$

CREATE PROCEDURE GetCustomerOrders(
    -- Procedures can accept IN, OUT and INOUT parameters.
    IN p_customer_name VARCHAR(100),
    OUT p_total_orders INT
)
BEGIN 
    -- Select the order details
    SELECT order_id, product_id, order_date, quantity FROM Orders
    WHERE customer_name = p_customer_name;

    -- Count the total number of orders and store it in the OUT parameter.
    SELECT COUNT(*) INTO p_total_orders FROM Orders
    WHERE customer_name = p_customer_name;
END $$

DELIMITER ;

-- Calling the Procedure.
SET @total_orders = 0;
CALL GetCustomerOrders('Customer Name', @total_orders);
SELECT @total_orders AS TotalOrders;

-- A Procedure that inserts a new order into the orders table.
DELIMITER //

CREATE PROCEDURE PlaceOrder(
    IN p_product_id INT,
    IN p_customer_name VARCHAR(100),
    IN p_quantity INT
)
BEGIN
    DECLARE stock INT;

    -- Check the stock availability.
    SELECT stock_quantity INTO stock
    FROM products
    WHERE id = p_product_id;

    IF stock >= p_quantity THEN
        -- Insert the order if stock is sufficient.
        INSERT INTO Orders (product_id, customer_name, order_date, quantity)
        VALUES (p_product_id, p_customer_name, CURDATE(), p_quantity);
        
        -- Update the stock quantity.
        UPDATE products
        SET stock_quantity = stock_quantity - p_quantity
        WHERE id = p_product_id;
    ELSE
        -- Raise an error if there is insufficient stock.
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock for this product';
    END IF;
END //

DELIMITER ;

-- Calling the Procedure.
CALL PlaceOrder(1, 'Customer Name', 2);

-- Dropping Stored Procedures.
DROP PROCEDURE IF EXISTS PlaceOrder;

-- --------------------------------------------------------------------------------
-- 14. Transactions
-- --------------------------------------------------------------------------------
-- Transaction is a sequence of one or more SQL operations that are executed 
-- as a single unit. If any statement fails, the entire transaction can be 
-- rolled back to maintain data integrity.
-- 
-- Transactions have the following properties (ACID):
-- * Atomicity: Entire transaction succeeds or fails as a whole.
-- * Consistency: Ensures valid state transitions in the database.
-- * Isolation: Transactions run independently of each other.
-- * Durability: Committed transactions persist, even after failures.
--
-- Basic Transaction Commands:
-- * START TRANSACTION / BEGIN: Begins a new transaction.
-- * COMMIT   : Saves all changes made in the transaction.
-- * ROLLBACK : Reverts all changes made in the transaction.
-- * SAVEPOINT: Sets a point to which you can roll back.

-- Start a transaction.
START TRANSACTION;

-- Insert a new product.
INSERT INTO products (product_name, category, price, stock_quantity, created_at)
VALUES ('Laptop', 'Electronics', 999.99, 50, '2023-01-15');

-- If something goes wrong, you would roll back the transaction.
ROLLBACK;

-- Commit the transaction, applying all changes.
COMMIT;

-- Another transaction.
START TRANSACTION;

-- Set a savepoint.
SAVEPOINT savepoint_1;
INSERT INTO products (product_name, category, price, stock_quantity, created_at)
VALUES 
    ('Smartphone', 'Electronics', 799.99, 150, '2023-02-01'),
    ('Desk Chair', 'Furniture', 199.99, 75, '2023-03-10');

-- If needed, roll back to the savepoint.
ROLLBACK TO SAVEPOINT savepoint_1;

-- if everything is correct, commit the transaction.
COMMIT;

-- --------------------------------------------------------------------------------
-- 15. Views
-- --------------------------------------------------------------------------------
-- Views are virtual tables based on the result of an SQL statement. 
-- They don't store data and provide a way to simplify complex queries, 
-- Improve data security and Ensure a consistent data interface.

-- Create a view to display products that have been ordered.
CREATE VIEW OrderedProducts AS
SELECT 
    p.id, 
    p.product_name, 
    p.category, 
    COUNT(o.order_id) AS times_ordered
FROM 
    Products p
JOIN 
    Orders o ON p.id = o.product_id
GROUP BY 
    p.id, p.product_name, p.category;

-- Create a view to display orders along with product details.
CREATE VIEW OrderDetails AS
SELECT 
    o.order_id, 
    o.customer_name, 
    o.order_date, 
    o.quantity, 
    p.product_name, 
    p.category, 
    p.price
FROM 
    Orders o
JOIN 
    Products p ON o.product_id = p.id;

-- Selecting the views.
SELECT * FROM OrderedProducts;
SELECT * FROM OrderDetails;

-- Dropping a view.
DROP VIEW OrderDetails;

-- --------------------------------------------------------------------------------
-- 16. Triggers
-- --------------------------------------------------------------------------------
-- Triggers are database objects that are automatically executed when 
-- certain events occurs. 
-- 
-- Types of triggers in MySQL:
-- * BEFORE INSERT, AFTER INSERT, BEFORE UPDATE, AFTER UPDATE, 
--   BEFORE DELETE, AFTER DELETE

-- This trigger checks if there is enough stock before placing an order.
DELIMITER //

CREATE TRIGGER before_order_insert
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE stock INT;
    
    -- Get the stock quantity of the product being ordered.
    SELECT stock_quantity INTO stock FROM Products WHERE id = NEW.product_id;
    
    -- Check if there's enough stock.
    IF stock < NEW.quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for this product';
    END IF;
END//

DELIMITER ;

-- This trigger adjusts the stock after an order's quantity is updated.
DELIMITER //

CREATE TRIGGER after_order_update
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    -- Adjust the stock quantity based on the new order quantity.
    UPDATE Products
    SET stock_quantity = stock_quantity - (NEW.quantity - OLD.quantity)
    WHERE id = NEW.product_id;
END//

DELIMITER ;

-- Dropping a trigger.
DROP TRIGGER after_order_update;

-- --------------------------------------------------------------------------------
-- 17. User Management
-- --------------------------------------------------------------------------------
-- User management involves creating, modifying, and deleting user 
-- accounts, as well as granting and revoking privileges.

-- Create a new user with a specified password.
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';

-- Grant SELECT, INSERT, and UPDATE privileges on the database to the user.
GRANT SELECT, INSERT, UPDATE ON my_database.* TO 'newuser'@'localhost';

-- Grant all privileges on the database to the user, with the ability to grant.
GRANT ALL PRIVILEGES ON my_database.* TO 'newuser'@'localhost' WITH GRANT OPTION;

-- Revoke INSERT privilege on the database from the user.
REVOKE INSERT ON my_database.* FROM 'newuser'@'localhost';

-- Revoke all privileges and the ability to grant privileges from the user.
REVOKE ALL PRIVILEGES, GRANT OPTION ON my_database.* FROM 'newuser'@'localhost';

-- Create a role and grant SELECT privileges on the database to that role.
CREATE ROLE 'view_role';
GRANT SELECT ON my_database.* TO 'view_role';

-- Assign the role to an existing user.
GRANT 'view_role' TO 'readonly_user'@'localhost';

-- Show the privileges granted to the user.
SHOW GRANTS FOR 'newuser'@'localhost';

-- Change the user's password.
ALTER USER 'newuser'@'localhost' IDENTIFIED BY 'newpassword';

-- Delete the user from the database.
DROP USER 'newuser'@'localhost';

-- --------------------------------------------------------------------------------
-- 18. Backup and Restore
-- --------------------------------------------------------------------------------
-- Regular backups are crucial for data safety and recovery.

-- Backup the entire database to a SQL file.
mysqldump -u username -p my_database > backup_file.sql;

-- Backup specific tables to a SQL file.
mysqldump -u username -p my_database table1 table2 > backup_file.sql;

-- Restore a database from a SQL file.
mysql -u username -p my_database < backup_file.sql;

-- Point-in-Time Recovery:

-- 1. Enable binary logging (in MySQL config my.cnf).
log-bin=mysql-bin
-- 2. List binary logs: 
SHOW BINARY LOGS;
-- 3. Apply binary logs up to a specific timestamp:
mysqlbinlog /path/to/mysql-bin.000001 | mysql -u username -p my_database

-- --------------------------------------------------------------------------------
-- 19. Locking
-- --------------------------------------------------------------------------------
-- A Mechanisms used to manage concurrent access to database resources.
-- Preventing conflicts when multiple transactions interact with the same data.
-- 
-- Main types of locks in MySQL:
-- 1. Table-level locks: Lock an entire table.
-- 2. Row-level locks: Lock specific rows within a table.
-- 3. Advisory locks: Custom, application-defined locks for complex scenarios.
-- 
-- Lock Types:
-- * Shared (Read) Lock: Allows multiple transactions to read the data, 
--   but prevents any transaction from modifying it.
-- * Exclusive (Write) Lock: Allows a transaction to modify data 
--   but prevents others from reading or modifying it.

-- Table-level locking: READ (or WRITE)
LOCK TABLES Products READ;
-- Perform read operations on the Products table
-- Release the lock
UNLOCK TABLES;

-- Row-level Locking: FOR UPDATE
START TRANSACTION;
-- This will lock the row where user_id = 1
SELECT * FROM Users WHERE user_id = 1 FOR UPDATE;
-- Perform operations on the locked row
UPDATE Users SET age = 30 WHERE user_id = 1;
-- Commit the transaction, releasing the lock
COMMIT;

-- Row-level Locking: SHARE MODE
START TRANSACTION;
-- Allows reading but prevents other transactions from writing to these rows.
SELECT * FROM Products WHERE category = 'Electronics' LOCK IN SHARE MODE;
-- Releases the shared lock
COMMIT;

-- --------------------------------------------------------------------------------
-- 20. Replication
-- --------------------------------------------------------------------------------
-- Is a process that allows you to automatically copy data from one 
-- database server (the master) to one or more database servers (the slaves).
-- 
-- Key concepts:
-- * Master: Source database server with original data.
-- * Slave: Server receiving data copies from the master.
-- * Binary Log: File recording all changes on the master.
-- * Relay Log: File on the slave with data from the master’s binary log.
--
-- Benefits :
-- High availability by allowing a slave to be promoted to master in case of 
-- failure, enables load balancing by distributing read queries across slaves, 
-- facilitates backups on a slave, and allows intensive data analysis

-- MASTER:
-- Step 1: Configure the Master Server (my.cnf or my.ini).
[mysqld]
server-id = 1
log-bin = mysql-bin
binlog-do-db = my_database  -- specify database to replicate

-- Create a Replication User on the Master.
CREATE USER 'repl_user'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';
FLUSH PRIVILEGES;

-- Lock the tables to prevent changes during the setup.
FLUSH TABLES WITH READ LOCK;  -- Lock all tables

-- Get Master Status.
SHOW MASTER STATUS;

UNLOCK TABLES;

-- SLAVE:
-- Configure the Slave Server (my.cnf or my.ini)
[mysqld]
server-id = 2
relay-log = mysql-relay-bin

-- Set Up the Slave.
CHANGE MASTER TO
    MASTER_HOST='master_ip_address',
    MASTER_USER='repl_user',
    MASTER_PASSWORD='password',
    MASTER_LOG_FILE='mysql-bin.000001', -- File value from 'Step 3'
    MASTER_LOG_POS=123;                 -- Position value from 'Step 3'

-- Start the Slave.
START SLAVE;

-- Verify Replication Status.
SHOW SLAVE STATUS;

-- Stop replication.
STOP SLAVE;

-- Reset replication.
RESET SLAVE;

-- --------------------------------------------------------------------------------
-- 21. Partitioning
-- --------------------------------------------------------------------------------
-- Is a database feature that allows you to divide a large table into smaller, 
-- more manageable pieces, yet still treat them as a single table.
-- 
-- Some common types of MySQL partitioning:
-- * RANGE: Divides the table based on a range of values.
-- * LIST: Divides the table based on a list of values.
-- * HASH: Distributes rows across a predefined number of partitions.
-- * KEY: Similar to HASH but uses MySQL’s internal function.
-- * COMPOSITE: Uses a combination of multiple partitioning methods.

-- RANGE Partitioning
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(8, 2) NOT NULL,
    stock_quantity INT,
    created_at DATE
)
PARTITION BY RANGE (YEAR(created_at)) (
    PARTITION p0 VALUES LESS THAN (2010),
    PARTITION p1 VALUES LESS THAN (2015),
    PARTITION p2 VALUES LESS THAN (2020),
    PARTITION p3 VALUES LESS THAN (MAXVALUE)  -- Handles all dates from 2020 onwards
);

-- Query data from a specific partition
SELECT * FROM products PARTITION (p1);

-- Add a new partition
ALTER TABLE products ADD PARTITION (PARTITION p5 VALUES LESS THAN (2025));

-- Remove a partition
ALTER TABLE products DROP PARTITION p0;

-- LIST Partitioning
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(8, 2) NOT NULL,
    stock_quantity INT,
    created_at DATE
)
PARTITION BY LIST (category) (
    PARTITION p_electronics VALUES IN ('Electronics'),
    PARTITION p_accessories VALUES IN ('Accessories'),
    PARTITION p_furniture VALUES IN ('Furniture'),
    PARTITION p_other VALUES IN ('Other')  -- Handles all other categories
);