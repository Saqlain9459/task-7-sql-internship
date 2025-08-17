use data;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

DESC Customers;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

DESC Orders;

INSERT INTO Customers VALUES
(1, 'Aarav Patil', 'aarav.patil@gmail.com', 'Pune'),
(2, 'Sai Deshmukh', 'sai.deshmukh@gmail.com', 'Mumbai'),
(3, 'Riya Kulkarni', 'riya.kulkarni@gmail.com', 'Nagpur'),
(4, 'Om Jadhav', 'om.jadhav@gmail.com', 'Nashik'),
(5, 'Ananya Shinde', 'ananya.shinde@gmail.com', 'Kolhapur'),
(6, 'Tanvi Pawar', 'tanvi.pawar@gmail.com', 'Aurangabad'),
(7, 'Yash Chavan', 'yash.chavan@gmail.com', 'Satara'),
(8, 'Meera Gokhale', 'meera.gokhale@gmail.com', 'Solapur'),
(9, 'Kunal Joshi', 'kunal.joshi@gmail.com', 'Thane'),
(10,'Ishita More', 'ishita.more@gmail.com', 'Sangli');

SELECT * FROM Customers;

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 1200, '2025-01-01'),
(102, 2, 'Mobile', 800, '2025-01-02'),
(103, 3, 'Headphones', 150, '2025-01-03'),
(104, 4, 'Tablet', 600, '2025-01-04'),
(105, 5, 'Mouse', 25, '2025-01-05'),
(106, 6, 'Smartwatch', 250, '2025-01-06'),
(107, 7, 'Printer', 300, '2025-01-07'),
(108, 8, 'Keyboard', 100, '2025-01-08'),
(109, 9, 'Monitor', 450, '2025-01-09'),
(110, 10,'Router', 150, '2025-01-10');

SELECT * FROM Orders;

CREATE VIEW customer_view AS
SELECT customer_id, name, city FROM Customers;

SELECT * FROM customer_view;

CREATE VIEW big_orders AS
SELECT order_id, product, amount
FROM Orders
WHERE amount > 500;

SELECT * FROM big_orders;

CREATE VIEW spending_summary AS
SELECT c.name, SUM(o.amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

SELECT * FROM spending_summary;

CREATE VIEW customer_orders AS
SELECT c.name, c.city, o.product, o.amount, o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;
SELECT * FROM customer_orders;

CREATE VIEW pune_customers AS
SELECT * FROM Customers
WHERE city = 'Pune';
SELECT * FROM pune_customers;

CREATE VIEW orders_count AS
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
SELECT * FROM orders_count;

CREATE VIEW top_customers AS
SELECT c.name, SUM(o.amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING SUM(o.amount) > 1000;
SELECT * FROM top_customers;

CREATE VIEW secure_customers AS
SELECT name, email FROM Customers;
SELECT * FROM secure_customers;

CREATE VIEW mumbai_customers AS
SELECT * FROM Customers
WHERE city = 'Mumbai'
WITH CHECK OPTION;
SELECT * FROM mumbai_customers;

DROP VIEW secure_customers;









