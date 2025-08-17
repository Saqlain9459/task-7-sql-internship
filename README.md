# Task 7 – Creating Views (SQL Developer Internship)

## 📌 Objective
Learn to **create and use SQL Views** for data abstraction and security.  
Views simplify queries, hide sensitive data, and provide controlled access to database tables.

---

## 🛠 Tools Used
- MySQL Workbench / DB Browser for SQLite  
- SQL (MySQL syntax used)

---

## 📂 Table Structures

### Customers Table
```sql
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

```
### Orders Table

```sql
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
```

## 📑 Views Created

1. **customer\_view** → Basic customer info
2. **big\_orders** → Orders greater than ₹500
3. **customer\_orders** → Customers with their orders (join)
4. **spending\_summary** → Total spending per customer
5. **pune\_customers** → Customers from Pune
6. **orders\_count** → Order count per customer
7. **top\_customers** → High-spending customers
8. **secure\_customers** → Customers with only name + email
9. **mumbai\_customers** → Mumbai customers (with `CHECK OPTION`)
10. **drop view example**

---

## 🖥️ Example Queries & Results

### Example 1: Customer Basic View

```sql
CREATE VIEW customer_view AS
SELECT customer_id, name, city FROM Customers;

SELECT * FROM customer_view;
```

📷 *Result Screenshot:*
![customer\_view result](https://github.com/user-attachments/assets/58367978-20d4-4733-8f39-f1db92e08301)

---

### Example 2: Orders Above 500

```sql
CREATE VIEW big_orders AS
SELECT order_id, product, amount
FROM Orders
WHERE amount > 500;

SELECT * FROM big_orders;
```

📷 *Result Screenshot:*
![big\_orders result](https://github.com/user-attachments/assets/24fbda72-379c-43ff-81c5-1ddd92bef278)

---

### Example 3: Spending Summary (Join + Aggregation)

```sql
CREATE VIEW spending_summary AS
SELECT c.name, SUM(o.amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

SELECT * FROM spending_summary;
```

📷 *Result Screenshot:*
![spending\_summary result](https://github.com/user-attachments/assets/756daaa9-274e-4f62-b42f-f19748afba08)

---

## 📤 Deliverables

* `Task7.sql` → Table creation, sample data, and view definitions
* `README.md` → Documentation of the task
* `screenshots/` → Query result screenshots

---

## ✅ Outcome

* Learned how to create and use **SQL Views**
* Understood **data abstraction and security**
* Practiced **joins, aggregation, and conditions** in views

```
