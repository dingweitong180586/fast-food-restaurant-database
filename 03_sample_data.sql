-- Sample Data for Fast Food Restaurant Database
-- Author: Weitong Ding
-- Technologies: SQL, Relational Database Design

INSERT INTO Customer (
    CustomerID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, MembershipTier, RewardPoints
) VALUES (
    1001, 'John', 'Smith', DATE '1998-04-12', '765-555-1001', 'john.smith@email.com', 'Gold', 120
);

INSERT INTO Customer (
    CustomerID, FirstName, LastName, DateOfBirth, PhoneNumber, Email, MembershipTier, RewardPoints
) VALUES (
    1002, 'Emily', 'Johnson', DATE '2000-09-25', '765-555-1002', 'emily.johnson@email.com', 'Silver', 80
);

INSERT INTO Kitchen (
    KitchenID, Location, Capacity, OperatingHour
) VALUES (
    201, 'Main Kitchen', 30, '8:00 AM - 10:00 PM'
);

INSERT INTO Kitchen (
    KitchenID, Location, Capacity, OperatingHour
) VALUES (
    202, 'Drive-Thru Kitchen', 20, '8:00 AM - 12:00 AM'
);

INSERT INTO Employee (
    EmployeeID, SSN, FirstName, LastName, DateOfBirth, Email, PhoneNumber, SupervisorID
) VALUES (
    3001, '111-22-3333', 'Michael', 'Brown', DATE '1985-02-15', 'michael.brown@restaurant.com', '765-555-3001', NULL
);

INSERT INTO Employee (
    EmployeeID, SSN, FirstName, LastName, DateOfBirth, Email, PhoneNumber, SupervisorID
) VALUES (
    3002, '222-33-4444', 'Sarah', 'Davis', DATE '1992-07-08', 'sarah.davis@restaurant.com', '765-555-3002', 3001
);

INSERT INTO Employee (
    EmployeeID, SSN, FirstName, LastName, DateOfBirth, Email, PhoneNumber, SupervisorID
) VALUES (
    3003, '333-44-5555', 'David', 'Wilson', DATE '1990-11-20', 'david.wilson@restaurant.com', '765-555-3003', 3001
);

INSERT INTO Orders (
    OrderID, OrderTime, Status, CustomerID, KitchenID
) VALUES (
    4001, SYSDATE, 'Preparing', 1001, 201
);

INSERT INTO Orders (
    OrderID, OrderTime, Status, CustomerID, KitchenID
) VALUES (
    4002, SYSDATE, 'Completed', 1002, 202
);

INSERT INTO Place_Order (
    CustomerID, OrderID, Payment
) VALUES (
    1001, 4001, 18.75
);

INSERT INTO Place_Order (
    CustomerID, OrderID, Payment
) VALUES (
    1002, 4002, 12.50
);

INSERT INTO Front_Counter (
    CounterID, CounterLocation, Capacity, OrderID, EmployeeID
) VALUES (
    501, 'Front Counter A', 10, 4001, 3002
);

INSERT INTO Front_Counter (
    CounterID, CounterLocation, Capacity, OrderID, EmployeeID
) VALUES (
    502, 'Drive-Thru Counter', 8, 4002, 3003
);

INSERT INTO Chef (
    EmployeeID, KitchenID
) VALUES (
    3002, 201
);

INSERT INTO Cashier (
    EmployeeID
) VALUES (
    3003
);

INSERT INTO Manager (
    EmployeeID
) VALUES (
    3001
);

COMMIT;
