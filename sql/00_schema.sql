-- Fast Food Restaurant Database Schema
-- Author: Weitong Ding
-- Technologies: SQL, Relational Database Design

CREATE TABLE Customer (
    CustomerID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    DateOfBirth DATE,
    PhoneNumber VARCHAR2(20),
    Email VARCHAR2(100),
    MembershipTier VARCHAR2(30),
    RewardPoints NUMBER DEFAULT 0
);

CREATE TABLE Kitchen (
    KitchenID NUMBER PRIMARY KEY,
    Location VARCHAR2(100),
    Capacity NUMBER,
    OperatingHour VARCHAR2(100)
);

CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    OrderTime DATE NOT NULL,
    Status VARCHAR2(30),
    CustomerID NUMBER NOT NULL,
    KitchenID NUMBER NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_orders_kitchen
        FOREIGN KEY (KitchenID) REFERENCES Kitchen(KitchenID)
);

CREATE TABLE Place_Order (
    CustomerID NUMBER,
    OrderID NUMBER,
    Payment NUMBER(8,2),
    PRIMARY KEY (CustomerID, OrderID),
    CONSTRAINT fk_place_customer
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_place_order
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Employee (
    EmployeeID NUMBER PRIMARY KEY,
    SSN VARCHAR2(20),
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    DateOfBirth DATE,
    Email VARCHAR2(100),
    PhoneNumber VARCHAR2(20),
    SupervisorID NUMBER,
    CONSTRAINT fk_employee_supervisor
        FOREIGN KEY (SupervisorID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Front_Counter (
    CounterID NUMBER PRIMARY KEY,
    CounterLocation VARCHAR2(100),
    Capacity NUMBER,
    OrderID NUMBER NOT NULL,
    EmployeeID NUMBER NOT NULL,
    CONSTRAINT fk_counter_order
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_counter_employee
        FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Chef (
    EmployeeID NUMBER PRIMARY KEY,
    KitchenID NUMBER NOT NULL,
    CONSTRAINT fk_chef_employee
        FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT fk_chef_kitchen
        FOREIGN KEY (KitchenID) REFERENCES Kitchen(KitchenID)
);

CREATE TABLE Cashier (
    EmployeeID NUMBER PRIMARY KEY,
    CONSTRAINT fk_cashier_employee
        FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Manager (
    EmployeeID NUMBER PRIMARY KEY,
    CONSTRAINT fk_manager_employee
        FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
