-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- Insert Customers
INSERT INTO Customers (customer_id, name, city) VALUES
(1, 'Abhay', 'Delhi'),
(2, 'Sumit', 'Mumbai'),
(3, 'Mohit', 'Jaipur'),
(4, 'Sushil', 'Kolkata');

-- Insert Orders
INSERT INTO Orders (order_id, customer_id, product) VALUES
(101, 1, 'Laptop'),
(102, 2, 'Phone'),
(103, 4, 'Tablet'),
(104, 2, 'Headphones');

-- INNER JOIN (only matching rows)
SELECT Customers.name, Customers.city, Orders.product
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- LEFT JOIN (all customers, even if no orders)
SELECT Customers.name, Customers.city, Orders.product
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- RIGHT JOIN (all orders, even if no customer exists)
-- Note: SQLite does not support RIGHT JOIN, but MySQL does
SELECT Customers.name, Customers.city, Orders.product
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- FULL OUTER JOIN (all customers and all orders)
-- SQLite does not support FULL OUTER JOIN, use UNION workaround
SELECT Customers.name, Customers.city, Orders.product
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.name, Customers.city, Orders.product
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;


SELECT*FROM Customers;
SELECT*FROM Orders;
