-- Index Design for Fast Food Restaurant Database
-- Author: Weitong Ding
-- Technologies: SQL, B-Tree Indexing, Query Optimization

/* Index for customer lookup in orders */
CREATE INDEX idx_orders_customer
ON Orders(CustomerID);

/* Index for kitchen workload queries */
CREATE INDEX idx_orders_kitchen
ON Orders(KitchenID);

/* Index for order status reporting */
CREATE INDEX idx_orders_status
ON Orders(Status);

/* Index for order time-based reporting */
CREATE INDEX idx_orders_time
ON Orders(OrderTime);

/* Index for employee supervisor lookup */
CREATE INDEX idx_employee_supervisor
ON Employee(SupervisorID);

/* Index for customer email lookup */
CREATE INDEX idx_customer_email
ON Customer(Email);
