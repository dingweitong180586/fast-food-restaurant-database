-- Business Queries for Fast Food Restaurant Database
-- Author: Weitong Ding
-- Technologies: SQL, Joins, Aggregation, Reporting Queries

/* 1. List all orders with customer and kitchen information */
SELECT
    o.OrderID,
    o.OrderTime,
    o.Status,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    k.Location AS KitchenLocation
FROM Orders o
JOIN Customer c
    ON o.CustomerID = c.CustomerID
JOIN Kitchen k
    ON o.KitchenID = k.KitchenID;

/* 2. Find all orders placed by a specific customer */
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderTime,
    o.Status
FROM Customer c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE c.CustomerID = 1001;

/* 3. Count orders by kitchen */
SELECT
    k.KitchenID,
    k.Location,
    COUNT(o.OrderID) AS TotalOrders
FROM Kitchen k
LEFT JOIN Orders o
    ON k.KitchenID = o.KitchenID
GROUP BY k.KitchenID, k.Location
ORDER BY TotalOrders DESC;

/* 4. Calculate total payment by customer */
SELECT
    c.CustomerID,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    SUM(p.Payment) AS TotalPayment
FROM Customer c
JOIN Place_Order p
    ON c.CustomerID = p.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalPayment DESC;

/* 5. List employees and their supervisors */
SELECT
    e.EmployeeID,
    e.FirstName || ' ' || e.LastName AS EmployeeName,
    s.EmployeeID AS SupervisorID,
    s.FirstName || ' ' || s.LastName AS SupervisorName
FROM Employee e
LEFT JOIN Employee s
    ON e.SupervisorID = s.EmployeeID;

/* 6. List front counter pickup assignments */
SELECT
    fc.CounterID,
    fc.CounterLocation,
    fc.Capacity,
    o.OrderID,
    o.Status,
    e.FirstName || ' ' || e.LastName AS EmployeeName
FROM Front_Counter fc
JOIN Orders o
    ON fc.OrderID = o.OrderID
JOIN Employee e
    ON fc.EmployeeID = e.EmployeeID;

/* 7. Find chefs and their assigned kitchens */
SELECT
    ch.EmployeeID,
    e.FirstName || ' ' || e.LastName AS ChefName,
    k.KitchenID,
    k.Location AS KitchenLocation
FROM Chef ch
JOIN Employee e
    ON ch.EmployeeID = e.EmployeeID
JOIN Kitchen k
    ON ch.KitchenID = k.KitchenID;

/* 8. Count orders by status */
SELECT
    Status,
    COUNT(*) AS OrderCount
FROM Orders
GROUP BY Status
ORDER BY OrderCount DESC;
