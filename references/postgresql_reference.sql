-- --------------------------------------------------------------------------------
-- PostgreSQL Reference and Guide

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
-- 13. Stored Procedures and Functions
-- 14. Transactions
-- 15. Views
-- 16. Triggers
-- 17. User Management
-- 18. Backup and Restore
-- 19. Concurrency Control
-- 20. Replication
-- 21. Partitioning
-- 22. Extensions
-- 23. JSON and JSONB
-- 24. Full-Text Search
-- 25. Window Functions
-- 26. Common Table Expressions (CTEs)
-- 27. Inheritance

-- --------------------------------------------------------------------------------
-- 1. Introduction
-- --------------------------------------------------------------------------------
-- Overview
-----------
-- PostgreSQL is a powerful open-source relational database management 
-- system (RDBMS). It uses and extends the SQL language combined with many 
-- features that safely store and scale the most complicated data workloads.

-- History
----------
-- PostgreSQL, often simply Postgres, was originally developed at the University
-- of California, Berkeley in 1986. It has more than 30 years of active development
-- and has earned a strong reputation for reliability, robustness, and performance.

-- Architecture
---------------
-- PostgreSQL uses a client/server model. A PostgreSQL session consists of the 
-- following processes:
-- 1. A server, which manages the database files, accepts connections from client
-- applications, and performs database actions on behalf of the clients.
-- 2. The user's client application that wants to perform database operations.

-- Components
-------------
-- Databases: A collection of schemas, which contains tables, functions, etc.
-- Schemas: A namespace that contains database objects like tables, views, etc.
-- Tables: Structures within a schema that hold data in rows and columns.
-- Rows: Individual records in a table.
-- Columns: Fields within a table that define the type of data stored.

-- SQL Commands
---------------
-- SQL commands in PostgreSQL are divided into several categories:
-- Data Definition Language (DDL): CREATE, ALTER, DROP, TRUNCATE
-- Data Manipulation Language (DML): SELECT, INSERT, UPDATE, DELETE
-- Data Control Language (DCL): GRANT, REVOKE
-- Transaction Control Language (TCL): BEGIN, COMMIT, ROLLBACK

-- --------------------------------------------------------------------------------
-- 2. Basic Syntax
-- --------------------------------------------------------------------------------

-- Comments
-----------
-- There are two types of comments: single-line and multi-line.

-- Single-line comment
/* Multi-line comment */

-- Semicolons
-------------
-- Each SQL statement should end with a semicolon.

SELECT 'Hello, PostgreSQL';

-- Case Sensitivity
-------------------
-- SQL Keywords are case-insensitive. Database, Table, and Column 
-- Names are also case-insensitive unless they are double-quoted.

CREATE DATABASE ExampleDB;
CREATE DATABASE "exampleDB"; -- This will create a different database

-- Schema Usage
---------------
-- Schemas are used to organize objects. The default schema is 'public'.

CREATE SCHEMA my_schema;
CREATE TABLE my_schema.my_table (id serial PRIMARY KEY);

-- Set the search path to prioritize 'my_schema'.
SET search_path TO my_schema, public;

-- --------------------------------------------------------------------------------
-- 3. Data Types
-- --------------------------------------------------------------------------------
-- PostgreSQL supports a wide variety of data types.

-- Numeric Types
INTEGER       -- Signed four-byte integer
BIGINT        -- Signed eight-byte integer
NUMERIC(p,s)  -- (precision,scale): Exact numeric of selectable precision
REAL          -- Single precision floating-point number
DOUBLE PRECISION -- Double precision floating-point number

-- Character Types
CHAR(n)       -- Fixed-length character string
VARCHAR(n)    -- Variable-length character string with limit
TEXT          -- Variable-length character string

-- Date/Time Types
DATE          -- Calendar date (year, month, day)
TIME          -- Time of day
TIMESTAMP     -- Date and time
INTERVAL      -- Time interval

-- Boolean Type
BOOLEAN       -- True or false

-- Enumerated Type
CREATE TYPE mood AS ENUM ('sad', 'happy');

-- Array Type
INTEGER[]     -- Array of integers
VARCHAR[]     -- Array of strings

-- JSON Types
JSON          -- Textual JSON data
JSONB         -- Binary JSON data, decomposed

-- Other Types
UUID          -- Universally Unique Identifiers
BYTEA         -- Binary data ("byte array")
CIDR          -- IPv4 or IPv6 network address
INET          -- IPv4 or IPv6 host address
MACADDR       -- MAC address

-- --------------------------------------------------------------------------------
-- 4. Database Operations
-- --------------------------------------------------------------------------------
-- Data is organized into databases, which contain schemas and tables.

-- Listing databases.
\l

-- Creating a database.
CREATE DATABASE my_database;

-- Dropping a database.
DROP DATABASE IF EXISTS my_database;

-- Connecting to a database.
\c my_database

-- --------------------------------------------------------------------------------
-- 5. Table Operations
-- --------------------------------------------------------------------------------
-- Tables are composed of columns (fields) and rows (records).

-- Creating a table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price NUMERIC(8, 2) NOT NULL,
    stock_quantity INTEGER,
    created_at DATE
);

-- Altering a table (add, modify, drop).
ALTER TABLE products ADD COLUMN description TEXT;
ALTER TABLE products ALTER COLUMN description SET NOT NULL;
ALTER TABLE products DROP COLUMN description;

-- Dropping a table.
DROP TABLE IF EXISTS products;

-- Describe table structure.
\d products

-- --------------------------------------------------------------------------------
-- 6. Constraints
-- --------------------------------------------------------------------------------
-- PostgreSQL constraints are used to specify rules for the data in a table.
-- They ensure the integrity of data in the database.
--
-- Common PostgreSQL constraints:
-- * PRIMARY KEY: Uniquely identifies each row in a table.
-- * FOREIGN KEY: Establishes a link between two tables.
-- * UNIQUE: Ensures all values in a column are distinct.
-- * NOT NULL: Ensures a column cannot have NULL values.
-- * CHECK: Ensures that all column values satisfy a specific condition.
-- * DEFAULT: Provides a default value, if no value is specified.

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,                     -- PRIMARY KEY constraint
    product_id INTEGER UNIQUE,                       -- UNIQUE constraint
    customer_name VARCHAR(100) NOT NULL,             -- NOT NULL constraint
    order_date DATE NOT NULL,                        -- NOT NULL constraint
    quantity INTEGER CHECK (quantity > 0),           -- CHECK constraint
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP   -- DEFAULT constraint
    FOREIGN KEY (product_id) REFERENCES products(id) -- FOREIGN KEY constraint
);

-- Adding a constraint.
ALTER TABLE orders ADD CONSTRAINT chk_valid_order CHECK (order_date <= CURRENT_DATE);

-- Adding an exclusion constraint.
CREATE TABLE reservations (
    room_id INT,
    during TSRANGE,
    -- Enforce that no two rows can have the same (room_id and time range).
    EXCLUDE USING GIST (room_id WITH =, during WITH &&)
);

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

-- Updating the price of a specific product based on its name.
UPDATE products SET price = 879.99 WHERE product_name = 'Smartphone';

-- Deleting a specific product based on its stock_quantity.
DELETE FROM products WHERE stock_quantity = 0;

-- --------------------------------------------------------------------------------
-- 8. Querying Data
-- --------------------------------------------------------------------------------
-- Retrieving data from your tables.

-- Retrieve all columns for each product.
SELECT * FROM products;

-- Retrieve only specific columns for each product.
SELECT product_name, price, stock_quantity FROM products;

-- Retrieve all products with a price greater than 500.
SELECT * FROM products WHERE price > 500;

-- Results can be ordered: ascending (ASC) or descending (DESC).
SELECT * FROM products ORDER BY created_at DESC;

-- Retrieve the first 10 products with their names and prices.
SELECT product_name, price FROM products LIMIT 10;

-- Retrieve the next 10 products after the first 10 (offset).
SELECT product_name, price FROM products OFFSET 10 LIMIT 10;

-- Retrieve all unique product categories.
SELECT DISTINCT category FROM products;

-----------
-- 9. Joins
-----------
-- Joins are crucial for querying data spread across multiple tables.
-- They are used to combine rows from two or more tables based 
-- on a related column between them.
--
-- Main types of PostgreSQL joins:
-- * INNER JOIN: Returns rows with matching values in both tables.
-- * LEFT JOIN : Returns all rows from the left table, and matching 
--               rows from the right table. unmatched right rows are NULL.
-- * RIGHT JOIN: Returns all rows from the right table, and matching 
--               rows from the left table. unmatched left rows are NULL.
-- * FULL JOIN : Returns all rows with matches in either table
--               unmatched rows are NULL.
-- * CROSS JOIN: Returns the Cartesian product of two tables, showing all 
--               possible row combinations.
-- * SELF JOIN : Joins a table with itself to compare same table rows.

-- INNER JOIN: Retrieve the order details and product name for all orders.
SELECT orders.order_id, products.product_name, orders.customer_name, orders.quantity, orders.order_date
FROM orders
INNER JOIN products ON orders.product_id = products.id;

-- LEFT JOIN: Retrieve all products with their order, if available, else NULL.
SELECT products.product_name, orders.order_id, orders.customer_name, orders.quantity, orders.order_date
FROM products
LEFT JOIN orders ON products.id = orders.product_id;

-- RIGHT JOIN: Retrieve all orders with their product, if available, else NULL.
SELECT products.product_name, orders.order_id, orders.customer_name, orders.quantity, orders.order_date
FROM products
RIGHT JOIN orders ON products.id = orders.product_id;

-- FULL JOIN: Retrieve all matched or unmatched products and orders, else NULL.
SELECT products.product_name, orders.order_id
FROM products
FULL JOIN orders ON products.id = orders.product_id;

-- CROSS JOIN: Retrieve all possible combinations of products and categories.
SELECT products.product_name, categories.category_name
FROM products
CROSS JOIN categories;

-- --------------------------------------------------------------------------------
-- 10. Aggregate Functions
-- --------------------------------------------------------------------------------
-- Used to perform calculations on a set of values and return a single value.
-- Often used with the GROUP BY clause to group rows that have the same values.

-- Common Postgres aggregate functions:
-- * COUNT(): Counts the number of rows or non-null values.
-- * SUM(): Calculates the sum of a set of values.
-- * AVG(): Calculates the average of a set of values.
-- * MAX(): Returns the maximum value in a set.
-- * MIN(): Returns the minimum value in a set.
-- * ARRAY_AGG(): Collects values into an array.
-- * STRING_AGG(): Concatenates strings with a delimiter.

-- Get the total number of orders.
SELECT COUNT(*) AS total_orders FROM orders;

-- Get the total amount of all orders.
SELECT SUM(amount) AS total_amount FROM orders;

-- Get the product count and average price for each category.
SELECT category, COUNT(*) AS product_count, AVG(price) AS average_price
FROM products
GROUP BY category;

-- Get categories with more than 5 products.
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
HAVING COUNT(*) > 5;

-- Get a list of products for each category as an array.
SELECT category, ARRAY_AGG(product_name) AS products
FROM products
GROUP BY category;

-- Get a comma-separated list of products for each category.
SELECT category, STRING_AGG(product_name, ', ') AS product_list
FROM products
GROUP BY category;

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

-- Scalar: Retrieve products priced above the overall average.
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- Row: Retrieve the product with the highest price across all categories.
SELECT *
FROM products
WHERE (category, price) = (
    SELECT category, MAX(price)
    FROM products
    GROUP BY category
    ORDER BY MAX(price) DESC
    LIMIT 1
);

-- Table: Retrieve products that have been ordered more than 100 times.
SELECT product_name, price
FROM products
WHERE id IN (
    SELECT product_id
    FROM orders
    GROUP BY product_id
    HAVING SUM(quantity) > 100
);

-- Correlated: Retrieve the most expensive product across all categories.
SELECT p.product_name, p.price
FROM products p
WHERE p.price > (
    SELECT AVG(price)
    FROM products
    WHERE category = p.category
);

-- --------------------------------------------------------------------------------
-- 12. Indexes
-- --------------------------------------------------------------------------------
-- Improve query performance by speeding up data retrieval. But may slow 
-- down data modification operations such as INSERT, UPDATE, and DELETE.
--
-- Types of indexes in PostgreSQL:
-- * B-tree: Default, for general use.
-- * Hash: Optimized for exact matches.
-- * GIST: Supports complex types, full-text search.
-- * SP-GiST: Efficient for non-balanced structures.
-- * GIN: Good for arrays and composite types.
-- * BRIN: Best for large, sequential data.

-- Create a B-tree index on product names.
CREATE INDEX idx_product_name ON products(product_name);

-- Create a unique B-tree index on SKU values.
CREATE UNIQUE INDEX idx_product_sku ON products(sku);

-- Create a B-tree index on category and price.
CREATE INDEX idx_product_category_price ON products(category, price);

-- Create a partial B-tree index on products with price greater than 1000.
CREATE INDEX idx_high_value_products ON products(price) WHERE price > 1000;

-- Create a B-tree index on lowercased product names.
CREATE INDEX idx_lower_product_name ON products(LOWER(product_name));

-- Drop the index on product names if it exists.
DROP INDEX IF EXISTS idx_product_name;

-- Rebuild all indexes for the products table.
REINDEX TABLE products;

-- --------------------------------------------------------------------------------
-- 13. Stored Procedures and Functions
-- --------------------------------------------------------------------------------
-- A set of SQL statements that can be stored and executed repeatedly.
-- They improve performance by reducing client-server communication.
--
-- * Procedures: Perform actions, may not return a value.
-- * Functions: Return a value, usable in SQL queries.

-- Create or replace a procedure to update a product's price.
CREATE OR REPLACE PROCEDURE update_product_price(
    product_id_param INTEGER,
    new_price NUMERIC
)
LANGUAGE plpgsql
-- Changes the delimiter to $$ to allow for multi-line statements.
AS $$
BEGIN
    UPDATE products
    SET price = new_price
    WHERE id = product_id_param;
END;
$$;

-- Call the procedure to update the price of product with ID 1.
CALL update_product_price(1, 1099.99);

-- Drop the procedure if it exists.
DROP PROCEDURE IF EXISTS update_product_price(INTEGER, NUMERIC);

-- Create or replace a function to get the count of products in a category.
CREATE OR REPLACE FUNCTION get_product_count(category_name VARCHAR)
RETURNS INTEGER AS $$
DECLARE
    product_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO product_count
    FROM products
    WHERE category = category_name;
    
    RETURN product_count;
END;
$$ LANGUAGE plpgsql;

-- Get the count of products in the 'Electronics' category.
SELECT get_product_count('Electronics');

-- Drop the function if it exists.
DROP FUNCTION IF EXISTS get_product_count(VARCHAR);

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

-- Start a transaction.
BEGIN;

-- Insert a new product.
INSERT INTO products (product_name, category, price, stock_quantity, created_at)
VALUES ('Laptop', 'Electronics', 999.99, 50, '2023-01-15');

-- if there's an error, roll back the transaction, discarding all changes.
ROLLBACK;

-- Commit the transaction, applying all changes.
COMMIT;


-- Starting another transaction.
BEGIN;

-- Insert a new product and set a savepoint.
INSERT INTO products (product_name, category, price, stock_quantity, created_at)
VALUES ('Smartphone', 'Electronics', 799.99, 150, '2023-02-01');

-- Set a savepoint.
SAVEPOINT my_savepoint;

-- Update stock quantity.
UPDATE products SET stock_quantity = stock_quantity - 1 WHERE id = 1;

-- Roll back to the savepoint, undoing changes since the savepoint.
ROLLBACK TO my_savepoint;

-- Release the savepoint, removing it from the transaction.
RELEASE SAVEPOINT my_savepoint;

-- Commit the transaction, applying all changes up to the savepoint.
COMMIT;

-- --------------------------------------------------------------------------------
-- 15. Views
-- --------------------------------------------------------------------------------
-- Views are virtual tables based on the result of an SQL statement. 
-- They don't store data and provide a way to simplify complex queries, 
-- improve data security and ensure a consistent data interface.
--
-- Types of PostgreSQL views:
-- 1. Simple: Based on one table or basic joins.
-- 2. Complex: Involve multiple tables or complex queries.
-- 3. Updatable: Allow INSERT, UPDATE, and DELETE.
-- 4. Materialized: Store results physically for faster access.

-- Create a simple view of product names and prices.
CREATE VIEW product_overview AS
SELECT product_name, price
FROM products;

-- Query the product overview view.
SELECT * FROM product_overview;

-- Create a detailed view of orders with product details.
CREATE VIEW detailed_order_summary AS
SELECT 
    o.customer_name, p.product_name, p.price, o.quantity,
    (p.price * o.quantity) AS total_cost,
    o.order_date
FROM orders o
JOIN products p ON o.product_id = p.id;

-- Query the detailed order summary view.
SELECT * FROM detailed_order_summary;

-- Create a materialized view summarizing product sales.
CREATE MATERIALIZED VIEW product_sales_summary AS
SELECT 
    p.id AS product_id,
    p.product_name,
    SUM(o.quantity) AS total_quantity_sold,
    SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.id
GROUP BY p.id, p.product_name;

-- Refresh the materialized view to update data.
REFRESH MATERIALIZED VIEW product_sales_summary;

-- Query the refreshed materialized view.
SELECT * FROM product_sales_summary;

-- Drop views and materialized view if they exist.
DROP VIEW IF EXISTS product_overview;
DROP VIEW IF EXISTS detailed_order_summary;
DROP MATERIALIZED VIEW IF EXISTS product_sales_summary;

-- --------------------------------------------------------------------------------
-- 16. Triggers
-- --------------------------------------------------------------------------------
-- Triggers are database objects that are automatically executed when 
-- certain events occurs. 
-- 
-- Types of triggers in MySQL:
-- * BEFORE INSERT, AFTER INSERT, BEFORE UPDATE, AFTER UPDATE, 
--   BEFORE DELETE and AFTER DELETE.
--
-- NEW: New row of data that is being inserted or updated.
-- OLD: Existing row of data before it is updated or deleted.

-- Define a function to update the stock quantity.
CREATE OR REPLACE FUNCTION update_stock_quantity()
RETURNS TRIGGER AS $$
BEGIN
    -- Decrease stock quantity based on the new order.
    UPDATE products 
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE id = NEW.product_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger to call the function after an order is inserted.
CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION update_stock_quantity();

-- Define a function to check the stock before inserting an order.
CREATE OR REPLACE FUNCTION check_stock_before_insert()
RETURNS TRIGGER AS $$
DECLARE
    stock INT;
BEGIN
    -- Check current stock quantity for the product.
    SELECT stock_quantity INTO stock FROM products WHERE id = NEW.product_id;
    
    -- Raise an exception if stock is insufficient.
    IF stock < NEW.quantity THEN
        RAISE EXCEPTION 'Insufficient stock for product ID %', NEW.product_id;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger to call the function before an order is inserted.
CREATE TRIGGER before_order_insert
BEFORE INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION check_stock_before_insert();

-- Drop the trigger if it exists.
DROP TRIGGER IF EXISTS before_order_insert ON orders;

-- Drop the stock checking function if it exists.
DROP FUNCTION IF EXISTS check_stock_before_insert();

-- --------------------------------------------------------------------------------
-- 17. User Management
-- --------------------------------------------------------------------------------
-- User management involves creating, modifying, and deleting user 
-- accounts, as well as granting and revoking privileges.

-- Create a new user with a password.
CREATE USER new_user WITH PASSWORD 'password123';

-- Create a superuser with a password.
CREATE USER admin_user WITH SUPERUSER PASSWORD 'adminpassword';

-- Grant SELECT and INSERT privileges on the products table to new_user.
GRANT SELECT, INSERT ON products TO new_user;

-- Grant all privileges on the public schema to new_user.
GRANT ALL PRIVILEGES ON SCHEMA public TO new_user;

-- Create a read-only role.
CREATE ROLE read_only;

-- Grant SELECT on all tables in the public schema to the read_only role.
GRANT SELECT ON ALL TABLES IN SCHEMA public TO read_only;

-- Grant the read_only role to new_user.
GRANT read_only TO new_user;

-- Revoke INSERT privilege on the products table from new_user.
REVOKE INSERT ON products FROM new_user;

-- Drop the user new_user if it exists.
DROP USER IF EXISTS new_user;

-- Drop the read_only role.
DROP ROLE read_only;

-- --------------------------------------------------------------------------------
-- 18. Backup and Restore
-- --------------------------------------------------------------------------------
-- Regular backups are crucial for data safety and recovery.

-- Backup the entire database to a SQL file.
pg_dump -U username -d database_name -f backup_file.sql;

-- Backup specific tables to a SQL file.
pg_dump -U username -d database_name -t table1 -t table2 -f backup_file.sql;

-- Backup only the schema (no data) to a SQL file.
pg_dump -U username -d database_name --schema-only -f schema_backup.sql;

-- Backup the database to a custom-format backup file.
pg_dump -U username -d database_name -F c -f backup_file.custom;

-- Backup the database to a directory format.
pg_dump -U username -d database_name -F d -f backup_directory;

-- Restore database from a custom-format backup file.
pg_restore -U username -d database_name backup_file.custom;

-- Restore database from a directory-format backup.
pg_restore -U username -d database_name backup_directory;

-- Restore database from a SQL file.
psql -U username -d database_name -f backup_file.sql;

-- Physical Backup
------------------
-- Creates binary copy of the database cluster to a specified directory.
pg_basebackup -U username -D backup_directory -Fp -Xs -P;

-- To Restore: 
-- 1. Stop the PostgreSQL server.
-- 2. Replace the existing data directory with the backup directory.
-- 3. Start the PostgreSQL server.

-- Point-in-Time Recovery
-------------------------
-- 1. Enable WAL Archiving:
ALTER SYSTEM SET archive_mode = 'on';
ALTER SYSTEM SET archive_command = 'cp %p /your/archive/directory/%f';
SELECT pg_reload_conf();

-- 2. Take Base Backup:
pg_basebackup -D /path/to/backup -Ft -z -P --wal-method=stream

-- 3. Stop the PostgreSQL server:
pg_ctl stop -D /path/to/data_directory

-- 4. Restore Backup:
tar -xvf /path/to/backup/base.tar.gz -C /path/to/data_directory

-- 5. Create recovery.conf with:
restore_command = 'cp /your/archive/directory/%f %p'
recovery_target_time = 'YYYY-MM-DD HH:MI:SS'

-- 6. Start the PostgreSQL server:
pg_ctl start -D /path/to/data_directory

-- --------------------------------------------------------------------------------
-- 19. Concurrency Control
-- --------------------------------------------------------------------------------
-- Concurrency Control ensures that multiple transactions can be executed
-- simultaneously, without interfering with each other, maintaining integrity
-- and consistency. By Default Postgres uses Multi-Version Concurrency Control.
--
-- Key concepts Concurrency Control:
-- * Multi-Version Concurrency Control (MVCC): Allows multiple versions of a 
--   row to exist, helping to manage concurrent access without locking.
-- * Isolation Levels: Controls visibility of transaction changes.
-- * Locks: Prevent conflicts between transactions.
-- * Deadlocks: Occur when transactions wait on each other's locks.

-- Isolation Levels
-------------------
-- * READ COMMITTED: Default. Sees data committed before each query.
-- * READ UNCOMMITTED: Can read uncommitted changes.
-- * REPEATABLE READ: Sees the same snapshot for all queries in the transaction.
-- * SERIALIZABLE: Ensures transactions act as if executed sequentially.

-- Setting an isolation level
BEGIN;
-- Set isolation level to Repeatable Read
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Perform some operations
SELECT * FROM products WHERE category = 'Electronics';
-- Commit the transaction
COMMIT;

-- Locks
--------
-- PostgreSQL lock types:
-- * Row-Level Locks:
--   - FOR UPDATE: Blocks row modifications and locks by others.
--   - FOR SHARE: Blocks modifications, allows reading.
-- * Table-Level Locks:
--   - ACCESS SHARE: Allows reads, blocks exclusive locks.
--   - ROW SHARE: Allows reads, row-level updates.
--   - ROW EXCLUSIVE: Allows inserts, updates, deletes.
--   - SHARE UPDATE EXCLUSIVE: Blocks schema changes, VACUUM.
--   - SHARE: Blocks modifications, allows reads.
--   - SHARE ROW EXCLUSIVE: Blocks modifications and certain locks.
--   - EXCLUSIVE: Allows only ACCESS SHARE locks.
--   - ACCESS EXCLUSIVE: Blocks all access.
-- * Advisory Locks: User-defined, for custom use cases.

-- Row-level locking:
BEGIN;
-- Locking row to update its stock quantity.
SELECT * FROM products WHERE id = 1 FOR UPDATE;
-- Update the locked row.
UPDATE products SET stock_quantity = stock_quantity - 1 WHERE id = 1;
-- Commit the transaction.
COMMIT;

-- Table-level locking:
BEGIN;
-- Lock the 'products' table in EXCLUSIVE mode
LOCK TABLE products IN EXCLUSIVE MODE;
-- Perform some operations
-- Commit the transaction
COMMIT;

-- Deadlock:
-- Transaction 1:
BEGIN;
-- Lock row 1 for update.
UPDATE example SET value = value + 1 WHERE id = 1;
-- Attempt to lock row 2, which is already locked by Transaction 2.
UPDATE example SET value = value + 1 WHERE id = 2;
-- Commit (will not reach due to deadlock).
COMMIT;

-- Transaction 2:
BEGIN;
-- Lock row 2 for update.
UPDATE example SET value = value + 1 WHERE id = 2;
-- Attempt to lock row 1, which is already locked by Transaction 1.
UPDATE example SET value = value + 1 WHERE id = 1;
-- Commit (will not reach due to deadlock).
COMMIT;

-- PostgreSQL detects the deadlock and aborts one of the transactions.

-- --------------------------------------------------------------------------------
-- 20. Replication
-- --------------------------------------------------------------------------------
-- Is a process that allows you to automatically copy data from one 
-- database server (the master) to one or more database servers (the slaves).
--
-- Benefits :
-- High availability by allowing a slave to be promoted to master in case of 
-- failure, enables load balancing by distributing read queries across slaves, 
-- facilitates backups on a slave, and allows intensive data analysis.
--
-- Key concepts:
-- * Primary: Source database server with original data.
-- * Standby: Destination server receiving data copies.
-- * WAL: Log of all changes, like MySQL's binary log.
-- * Streaming Replication: Real-time WAL transfer to standby.
-- * Physical Replication: Byte-by-byte copy of the database.
-- * Logical Replication: Replication based on object-level changes.

-- PostgreSQL Primary Configuration:
-- Set up WAL for replication.
wal_level = replica    -- WAL level for replication
max_wal_senders = 10   -- Max concurrent WAL sender processes
wal_keep_size = '1GB'  -- Size of WAL to keep for replication
hot_standby = on       -- Allow queries on standby

-- Create replication user.
CREATE USER repl_user WITH REPLICATION ENCRYPTED PASSWORD 'password';

-- Allow replication connections from replica.
host replication repl_user <replica_ip_address>/24 md5

-- Perform a base backup from the primary server.
pg_basebackup -h <primary_ip_address> -D /path_to_data -U replicator -P --wal-method=stream

-- PostgreSQL Replica Configuration:
-- Enable hot standby and configure primary connection.
hot_standby = on
primary_conninfo = 'host=<primary_ip> port=5432 user=replicator password=replica_password'
trigger_file = '/tmp/postgresql.trigger'

-- Start the standby server.
pg_ctl start -D /path/to/standby/data

-- Monitor replication status.
SELECT * FROM pg_stat_replication;

-- Check the WAL receiver status.
SELECT * FROM pg_stat_wal_receiver;

-- Pause WAL replay on the replica.
SELECT pg_wal_replay_pause();

-- Resume WAL replay on the replica.
SELECT pg_wal_replay_resume();

-- Promote the replica to primary.
pg_ctl promote -D /path/to/standby/data

-- --------------------------------------------------------------------------------
-- 21. Partitioning
-- --------------------------------------------------------------------------------
-- Is a database feature that allows you to divide a large table into 
-- smaller, more manageable pieces, yet still treat them as a single table.
--
-- Main types of partitioning in PostgreSQL:
-- 1. Range: Based on a range of values (e.g., date ranges).
-- 2. List : Based on a list of known values (e.g., categories).
-- 3. Hash : Based on a hash of the partition key.

-- Create a range-partitioned table by creation date.
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(8, 2) NOT NULL,
    stock_quantity INT,
    created_at DATE
) PARTITION BY RANGE (created_at);

-- Create a partition for the year 2023.
CREATE TABLE products_2023 PARTITION OF products
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

-- Create a partition for the year 2024.
CREATE TABLE products_2024 PARTITION OF products
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Create a default partition for any non-matching dates.
CREATE TABLE products_default PARTITION OF products DEFAULT;

-- Create a list-partitioned table by category.
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(8, 2) NOT NULL,
    stock_quantity INT,
    created_at DATE
) PARTITION BY LIST (category);

-- Create a partition for Electronics.
CREATE TABLE products_electronics PARTITION OF products
FOR VALUES IN ('Electronics');

-- Create a partition for Furniture.
CREATE TABLE products_furniture PARTITION OF products
FOR VALUES IN ('Furniture');

-- Create a default partition for any non-matching categories.
CREATE TABLE products_default PARTITION OF products DEFAULT;

-- After partitioning a table, you can insert, update, delete, and 
-- query data without any special modification to your queries.

-- Detach a partition, making it a standalone table.
ALTER TABLE products DETACH PARTITION products_2023;

-- Reattach a detached partition or add a new table as a partition.
ALTER TABLE products ATTACH PARTITION products_2023 
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

-- Permanently delete a partition and its data.
DROP TABLE products_2023;

-- --------------------------------------------------------------------------------
-- 22. Extensions
-- --------------------------------------------------------------------------------
-- Extensions are packages that add functionality to the database.
-- They can include additional data types, functions, operators, and more.
--
-- Key aspects of PostgreSQL Extensions:
-- 1. Modularity: Encapsulate related objects and functionality.
-- 2. Versioning: Extensions can be upgraded or downgraded.
-- 3. Dependency management: Extensions can depend on other extensions.
-- 4. Easy installation: Can be installed with a single SQL command.
--
-- Common PostgreSQL Extensions:
-- * PostGIS: Adds support for geographic objects.
-- * pgcrypto: Provides cryptographic functions.
-- * hstore: Implements key-value pair storage.
-- * uuid-ossp: Generates universally unique identifiers (UUIDs).

-- List available extensions.
SELECT * FROM pg_available_extensions;

-- List installed extensions.
SELECT * FROM pg_extension;

-- Install the hstore extension if it's not already installed.
CREATE EXTENSION IF NOT EXISTS hstore;

-- Create a table with an hstore column.
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT,
    attributes hstore  -- hstore extension column
);

-- Insert data into the table with hstore attributes.
INSERT INTO products (name, attributes) VALUES
('Laptop', 'brand => "Dell", cpu => "Intel i7", ram => "16GB"');

-- Update the hstore extension to the latest version.
ALTER EXTENSION hstore UPDATE;

-- Remove the hstore extension if it exists.
DROP EXTENSION IF EXISTS hstore;
-- --------------------------------------------------------------------------------
-- 23. JSON and JSONB
-- --------------------------------------------------------------------------------
-- PostgreSQL provides robust support for JSON, offering two main options:
-- 1. JSON: Stores data as plain text.
-- 2. JSONB: Stores data in a binary format for faster processing and indexing.

-- Create tables with JSON and JSONB columns.
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_details JSON
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_data JSONB
);

-- Inserting JSON data.
INSERT INTO orders (order_details) VALUES
('{"items": [{"product_id": 1, "quantity": 2}, {"product_id": 2, "quantity": 1}], "total": 1229.98, "status": "pending"}');

-- Insert JSONB data.
INSERT INTO products (product_data) VALUES
('{"name": "Laptop", "brand": "LaptopBrand", "specs": {"cpu": "i7", "ram": "16GB", "storage": "512GB SSD"}, "price": 999.99}'),
('{"name": "Mouse", "brand": "MouseBrand", "specs": {"dpi": "16000", "buttons": 8}, "price": 59.99}');

-- Retrieve the list of items from a specific order, '->' to extract JSON.
SELECT order_details->'items' AS items FROM orders;

-- Extract the product name as text from product_data, '->>' to extract text.
SELECT product_data->>'name' AS product_name FROM products;

-- Extract the CPU specification from the "specs" object (returns text).
SELECT product_data->'specs'->>'cpu' AS cpu FROM products WHERE product_data->>'name' = 'Laptop';

-- Retrieve the product_id of the first item in the order's items array.
SELECT order_details->'items'->0->>'product_id' AS first_item_id FROM orders;

-- Update the price of a product in the JSONB column.
UPDATE products SET product_data = jsonb_set(product_data, '{price}', '1099.99')
WHERE product_data->>'name' = 'Laptop';

-- Add a new field to the JSON data in the orders table.
UPDATE orders SET order_details = order_details || '{"shipping_method": "express"}'::json
WHERE (order_details->>'total')::numeric > 1000;

-- Remove a field from the JSONB data in the products table.
UPDATE products SET product_data = product_data - 'brand'
WHERE product_data->>'name' = 'Mouse';

-- json_each: Expands the outermost JSON object into key-value pairs.
SELECT * FROM json_each((SELECT order_details FROM orders LIMIT 1));

-- jsonb_object_keys: Returns the top-level keys of a JSONB object.
SELECT jsonb_object_keys(product_data) FROM products LIMIT 1;

-- jsonb_array_elements: Expands a JSON array to a set of JSON values.
SELECT jsonb_array_elements(order_details->'items') FROM orders;

-- jsonb_build_object: Builds a JSONB object from key-value pairs
INSERT INTO products (product_data) 
SELECT jsonb_build_object('name', 'Keyboard', 'brand', 'KeyboardBrand', 'price', 79.99);

-- jsonb_pretty: Formats JSONB data with indentation.
SELECT jsonb_pretty(product_data) FROM products LIMIT 1;

-- Check if JSONB contains (@>) specified key-value pair.
SELECT * FROM products WHERE product_data @> '{"brand": "LaptopBrand"}';

-- Check if JSONB is contained by (<@) another JSONB.
SELECT '{"name": "Laptop", "brand": "LaptopBrand"}'::jsonb <@ product_data FROM products;

-- Check if JSON object contains (?) the specified key.
SELECT * FROM orders WHERE order_details ? 'shipping_method';

-- Check if JSON object contains any (?|) of the specified keys.
SELECT * FROM products WHERE product_data ?| array['name', 'color'];

-- Check if JSON object contains all (?&) of the specified keys.
SELECT * FROM products WHERE product_data ?& array['name', 'price'];

-- --------------------------------------------------------------------------------
-- 24. Full-Text Search
-- --------------------------------------------------------------------------------
-- A powerful feature for fast and flexible text searching and 
-- ranking (how well a document matches a query) in large text fields.
--
-- Main components:
-- * tsvector: Text search vector.
-- * tsquery: Text search query.
-- * to_tsvector(): Converts text to tsvector.
-- * to_tsquery(): Converts search string to tsquery.
-- * @@: Text search match operator.

-- Creating a table with a text column.
CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    title TEXT,
    content TEXT
);

-- Inserting sample data.
INSERT INTO articles (title, content) VALUES
    ('PostgreSQL Basics', 'PostgreSQL is a powerful, open-source relational database system.'),
    ('Advanced SQL', 'SQL is a standard language for storing, manipulating, and retrieving data in databases.'),
    ('Full-Text Search', 'Full-text search allows efficient searching of large volumes of text data.');

-- Basic full-text search using to_tsvector and to_tsquery.
SELECT title FROM articles
WHERE to_tsvector('english', content) @@ to_tsquery('english', 'database');

-- Adding a dedicated tsvector column for better performance.
ALTER TABLE articles ADD COLUMN content_tsv TSVECTOR;
UPDATE articles SET content_tsv = to_tsvector('english', content);

-- Creating an index on the tsvector column.
CREATE INDEX content_tsv_idx ON articles USING GIN (content_tsv);

-- Searching with multiple terms using AND operator.
SELECT title FROM articles
WHERE content_tsv @@ to_tsquery('english', 'database & search');

-- Ranking search results by relevance.
SELECT title, ts_rank(content_tsv, query) AS rank
FROM articles, to_tsquery('english', 'database | search') query
WHERE content_tsv @@ query
ORDER BY rank DESC;

-- Highlighting matched text in search results.
SELECT ts_headline('english', content, to_tsquery('english', 'database'),
       'StartSel = <b>, StopSel = </b>, MaxWords=50, MinWords=5')
FROM articles
WHERE content_tsv @@ to_tsquery('english', 'database');

-- Searching for an exact phrase in the content.
SELECT title FROM articles
WHERE content_tsv @@ phraseto_tsquery('english', 'open-source database');

-- Automatically updating tsvector column on insert or update.
CREATE FUNCTION articles_trigger() RETURNS trigger AS $$
BEGIN
  NEW.content_tsv := to_tsvector('english', NEW.content);
  RETURN NEW;
END
$$ LANGUAGE plpgsql;

-- Trigger to update the tsvector column whenever content changes.
CREATE TRIGGER tsvector_update BEFORE INSERT OR UPDATE
ON articles FOR EACH ROW EXECUTE FUNCTION articles_trigger();

-- Creating a table for articles stored as JSONB data.
CREATE TABLE json_articles (
    id SERIAL PRIMARY KEY,
    data JSONB
);

-- Inserting a sample article as JSON data.
INSERT INTO json_articles (data) VALUES
    ('{"title": "JSON in PostgreSQL", "content": "PostgreSQL offers robust support for JSON data types."}');

-- Full-text search within JSON content.
SELECT data->>'title'
FROM json_articles
WHERE to_tsvector('english', data->>'content') @@ to_tsquery('english', 'json');

-- --------------------------------------------------------------------------------
-- 25. Window Functions
-- --------------------------------------------------------------------------------
-- Perform calculations across a set of rows related to the current row, 
-- without grouping them, allowing each row to retain its identity.

-- Syntax:
-- function_name ([exp]) OVER ([PARTITION BY exp] [ORDER BY exp])
--
-- Commonly used window functions:
-- 1. ROW_NUMBER(): Assigns a unique sequential integer per partition.
-- 2. RANK(): Rank each row within a partition, with gaps in rank for ties.
-- 3. DENSE_RANK(): Similar to RANK(), but without gaps in rank.
-- 4. NTILE(): Distributes rows into a specified number of buckets.
-- 5. LAG()/LEAD(): Accesses previous/next row within the same result set.
-- 6. SUM(), AVG(), COUNT(), etc.: Can also be used as window functions.

-- Assign a unique row number to each order per product, ordered by date.
SELECT product_id, customer_name, order_date,
    ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY order_date) AS row_num
FROM orders;

-- Rank orders per product based on the quantity, highest quantity = rank 1.
SELECT product_id, customer_name, quantity,
    RANK() OVER (PARTITION BY product_id ORDER BY quantity DESC) AS rank
FROM orders;

-- Retrieve the quantity of the next order for each order per product.
SELECT product_id, customer_name, quantity,
    LEAD(quantity, 1) OVER (PARTITION BY product_id ORDER BY order_date) AS next_quantity
FROM orders;

-- Calculate total of quantity ordered for each product, ordered by date.
SELECT product_id, customer_name, quantity,
    SUM(quantity) OVER (PARTITION BY product_id ORDER BY order_date) AS running_total
FROM orders;

-- --------------------------------------------------------------------------------
-- 26. Common Table Expressions (CTEs)
-- --------------------------------------------------------------------------------
-- CTEs are temporary result sets that can be referenced within a 
-- `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement in PostgreSQL.
--
-- Benefits:
-- * Improve query readability by breaking down complex queries.
-- * Reusable within the query and aid in recursive query scenarios.
--
-- Main Types of CTEs:
-- 1. Non-Recursive CTEs: Simple CTEs that don’t refer back to themselves.
-- 2. Recursive CTEs: Reference themselves, useful for hierarchical data.

-- Select products with a price greater than 100.
WITH TopProducts AS (
  SELECT product_id, name, price
  FROM Products
  WHERE price > 100
)
SELECT * FROM TopProducts;

-- Update prices for 'Electronics' and select updated product IDs.
WITH UpdatedProducts AS (
    UPDATE Products
    SET price = price * 1.1
    WHERE category = 'Electronics'
    RETURNING product_id
)
SELECT product_id
FROM UpdatedProducts;

-- Apply a 10% discount to 'Electronics' category products.
WITH DiscountedProducts AS (
  SELECT product_id, price
  FROM Products
  WHERE category = 'Electronics'
)
UPDATE Products SET price = price * 0.9
WHERE product_id IN (SELECT product_id FROM DiscountedProducts);

-- Recursive CTE to get the hierarchy of the 'Electronics' category.
WITH RECURSIVE CategoryHierarchy AS (
  -- Select the base category 'Electronics'.
  SELECT id, name, parent_id
  FROM Categories
  WHERE name = 'Electronics'

  UNION ALL

  -- Recursively select child categories.
  SELECT c.id, c.name, c.parent_id
  FROM Categories c
  INNER JOIN CategoryHierarchy ch ON c.parent_id = ch.id
)
SELECT * FROM CategoryHierarchy;

-- --------------------------------------------------------------------------------
-- 27. Inheritance
-- --------------------------------------------------------------------------------
-- A powerful feature that allows a table to inherit columns and 
-- constraints from a parent table.
-- 
-- Key concepts:
-- * Parent table: Base table with common columns.
-- * Child table: Inherits from parent, adds specific columns.
-- * Inheritance hierarchy: Supports multiple inheritance levels.
-- * Data distribution: Each table stores its own data.
-- * Polymorphic queries: Query parent to retrieve data from children.

-- Create a parent table for products.
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price NUMERIC(8, 2) NOT NULL,
    stock_quantity INTEGER,
    created_at DATE
);

-- Create a child table for electronics, inheriting from products.
CREATE TABLE electronics (
    warranty_period INTEGER
) INHERITS (products);

-- Insert into the parent table.
INSERT INTO products (product_name, category, price, stock_quantity, created_at) 
VALUES ('Generic Product', 'Miscellaneous', 19.99, 100, CURRENT_DATE);

-- Insert into the child with inherited columns and additional data.
INSERT INTO electronics (product_name, category, price, stock_quantity, created_at, warranty_period) 
VALUES ('Smartphone', 'Electronics', 699.99, 50, CURRENT_DATE, 24);

-- Select all rows, including inherited rows, from the parent.
SELECT * FROM products;

-- Select only rows from the parent, excluding inherited rows.
SELECT * FROM ONLY products;

-- Select all rows from the child table.
SELECT * FROM electronics;

-- Add a column to the parent, which also adds it to the child.
ALTER TABLE products ADD COLUMN supplier VARCHAR(100);

-- Drop the child table.
DROP TABLE electronics;

-- Dropping the parent won't drop the child tables automatically.
DROP TABLE products;