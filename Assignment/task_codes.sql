-- Active: 1698769216474@@127.0.0.1@3306@assignment_6
-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    location VARCHAR(255)
);
-- Create the Categories table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(255)
);
-- Create the Products table with a foreign key relationship to Categories
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
-- Create the Orders table with a foreign key relationship to Customers
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- Create the Order_Items table with foreign key relationships to Orders and Products
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

--Task 1
--Write a SQL query to retrieve all the customer information along with the total number of orders placed by each customer. Display the result in descending order of the number of orders.
SELECT c.customer_id, c.name, c.email, c.location, COUNT(o.order_id) AS total_orders
FROM Customers AS c
LEFT JOIN Orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.email, c.location
ORDER BY total_orders DESC;

--Task 2
--Write a SQL query to retrieve the product name, quantity, and total amount for each order item. Display the result in ascending order of the order ID.
SELECT p.name AS product_name, oi.quantity, (oi.quantity * oi.unit_price) AS total_amount, oi.order_id
FROM Products AS p
INNER JOIN Order_Items AS oi ON p.product_id = oi.product_id
ORDER BY oi.order_id ASC;

--Task 3
--Write a SQL query to retrieve the total revenue generated by each product category. Display the category name along with the total revenue in descending order of the revenue.
SELECT c.name AS category_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM Categories AS c
INNER JOIN Products AS p ON c.category_id = p.category_id
INNER JOIN Order_Items AS oi ON p.product_id = oi.product_id
GROUP BY c.name
ORDER BY total_revenue DESC;

--Task 4
--Write a SQL query to retrieve the top 5 customers who have made the highest total purchase amount. Display the customer name along with the total purchase amount in descending order of the purchase amount.
SELECT c.name AS customer_name, SUM(oi.quantity * oi.unit_price) AS total_purchase_amount
FROM Customers AS c
INNER JOIN Orders AS o ON c.customer_id = o.customer_id
INNER JOIN Order_Items AS oi ON o.order_id = oi.order_id
GROUP BY c.name
ORDER BY total_purchase_amount DESC
LIMIT 5;