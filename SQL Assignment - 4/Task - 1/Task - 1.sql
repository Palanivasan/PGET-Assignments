CREATE DATABASE CMS_DB

USE CMS_DB

-- User Table

CREATE TABLE Users (
    UserID INT,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT,
    CONSTRAINT PK_User PRIMARY KEY (UserID)
)

-- Courier Table

CREATE TABLE Courier (
    CourierID INT,
    SenderName VARCHAR(30),
    SenderAddress NVARCHAR(200),
    ReceiverName VARCHAR(30),
    ReceiverAddress TEXT,
    Weight DECIMAL(5,2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE,
    CONSTRAINT PK_Courier PRIMARY KEY (CourierID)
)

-- Courier Services Table

CREATE TABLE CourierServices (
    ServiceID INT,
    ServiceName VARCHAR(100),
    Cost MONEY,
    CONSTRAINT PK_CourierServices PRIMARY KEY (ServiceID)
)

-- Employee Table

CREATE TABLE Employee (
    EmployeeID INT,
    Name VARCHAR(25),
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary MONEY,
    CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID)
)

-- Location Table

CREATE TABLE Location (
    LocationID INT,
    LocationName VARCHAR(30),
    Address NVARCHAR(200),
    CONSTRAINT PK_Location PRIMARY KEY (LocationID)
)

-- Payment Table

CREATE TABLE Payment (
    PaymentID INT,
    CourierID INT,
    LocationID INT,
    Amount MONEY,
    PaymentDate DATE,
    CONSTRAINT PK_Payment PRIMARY KEY (PaymentID),
    CONSTRAINT FK_Payment_Courier FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    CONSTRAINT FK_Payment_Location FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
)

-- Insert data into User table

INSERT INTO Users (UserID, Name, Email, Password, ContactNumber, Address) VALUES
(1, 'Palanivasan', 'pv@gmail.com', 'pass123', '9876543210', 'Chennai, Tamil Nadu'),
(2, 'Arun', 'arun@gmail.com', 'pass456', '9966554433', 'Coimbatore, Tamil Nadu'),
(3, 'Meena', 'meena@gmail.com', 'pass789', '9845123456', 'Madurai, Tamil Nadu'),
(4, 'Karthik', 'karthik@gmail.com', 'pass111', '9786543210', 'Tiruchirappalli, Tamil Nadu'),
(5, 'Divya', 'divya@gmail.com', 'pass222', '9678563412', 'Salem, Tamil Nadu'),
(6, 'Rajesh', 'rajesh@gmail.com', 'pass333', '9445123456', 'Erode, Tamil Nadu'),
(7, 'Suresh', 'suresh@gmail.com', 'pass444', '9556234789', 'Vellore, Tamil Nadu'),
(8, 'Lakshmi', 'lakshmi@gmail.com', 'pass555', '9005123478', 'Thanjavur, Tamil Nadu'),
(9, 'Bala', 'bala@gmail.com', 'pass666', '8901234567', 'Thoothukudi, Tamil Nadu'),
(10, 'Anitha', 'anitha@gmail.com', 'pass777', '9123456789', 'Kanyakumari, Tamil Nadu')

-- Insert data into Courier table

INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate) VALUES
(201, 'Palanivasan', 'Chennai', 'Meena', 'Madurai', 2.5, 'In Transit', 'TN12345', '2025-04-10'),
(202, 'Arun', 'Coimbatore', 'Palanivasan', 'Chennai', 1.2, 'Delivered', 'TN54321', '2025-04-05'),
(203, 'Meena', 'Madurai', 'Arun', 'Coimbatore', 3.0, 'Pending', 'TN67890', '2025-04-15'),
(204, 'Karthik', 'Tiruchirappalli', 'Divya', 'Salem', 2.0, 'Delivered', 'TN11223', '2025-04-07'),
(205, 'Divya', 'Salem', 'Rajesh', 'Erode', 1.5, 'In Transit', 'TN33445', '2025-04-12'),
(206, 'Rajesh', 'Erode', 'Suresh', 'Vellore', 2.8, 'Pending', 'TN55667', '2025-04-20'),
(207, 'Suresh', 'Vellore', 'Lakshmi', 'Thanjavur', 3.5, 'Delivered', 'TN77889', '2025-04-09'),
(208, 'Lakshmi', 'Thanjavur', 'Bala', 'Thoothukudi', 4.0, 'In Transit', 'TN99001', '2025-04-14'),
(209, 'Bala', 'Thoothukudi', 'Anitha', 'Kanyakumari', 1.0, 'Pending', 'TN22334', '2025-04-22'),
(210, 'Anitha', 'Kanyakumari', 'Palanivasan', 'Chennai', 2.3, 'Delivered', 'TN44556', '2025-04-11')

-- Insert data into Location table

INSERT INTO Location (LocationID, LocationName, Address) VALUES
(1, 'Chennai', 'Chennai, Tamil Nadu'),
(2, 'Coimbatore', 'Coimbatore, Tamil Nadu'),
(3, 'Madurai', 'Madurai, Tamil Nadu'),
(4, 'Tiruchirappalli', 'Tiruchirappalli, Tamil Nadu'),
(5, 'Salem', 'Salem, Tamil Nadu'),
(6, 'Erode', 'Erode, Tamil Nadu'),
(7, 'Vellore', 'Vellore, Tamil Nadu'),
(8, 'Thanjavur', 'Thanjavur, Tamil Nadu'),
(9, 'Thoothukudi', 'Thoothukudi, Tamil Nadu'),
(10, 'Kanyakumari', 'Kanyakumari, Tamil Nadu')

-- Insert data into Payment table

INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate) VALUES
(1, 201, 1, 100.00, '2025-04-10'),
(2, 202, 2, 250.00, '2025-04-05'),
(3, 203, 3, 500.00, '2025-04-15'),
(4, 204, 4, 400.00, '2025-04-07'),
(5, 205, 5, 1500.00, '2025-04-12'),
(6, 206, 6, 2000.00, '2025-04-20'),
(7, 207, 7, 50.00, '2025-04-09'),
(8, 208, 8, 300.00, '2025-04-14'),
(9, 209, 9, 1200.00, '2025-04-22'),
(10, 210, 10, 600.00, '2025-04-11')

-- Insert data into CourierServices table

INSERT INTO CourierServices (ServiceID, ServiceName, Cost) VALUES
(1, 'Standard Delivery', 100.00),
(2, 'Express Delivery', 250.00),
(3, 'Same Day Delivery', 500.00),
(4, 'Overnight Delivery', 400.00),
(5, 'International Shipping', 1500.00),
(6, 'Bulk Shipping', 2000.00),
(7, 'Document Delivery', 50.00),
(8, 'Fragile Item Handling', 300.00),
(9, 'Warehouse Storage', 1200.00),
(10, 'Special Handling', 600.00)

-- Insert data into Employee table

INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary) VALUES
(1, 'Kumar', 'kumar@gmail.com', '9876123450', 'Manager', 60000.00),
(2, 'Saravanan', 'saravanan@gmail.com', '9898989898', 'Delivery Executive', 25000.00),
(3, 'Mohan', 'mohan@gmail.com', '9797979797', 'Customer Support', 30000.00),
(4, 'Vimal', 'vimal@gmail.com', '9696969696', 'Warehouse Manager', 40000.00),
(5, 'Jaya', 'jaya@gmail.com', '9595959595', 'HR', 35000.00),
(6, 'Deepa', 'deepa@gmail.com', '9494949494', 'Accountant', 32000.00),
(7, 'Aravind', 'aravind@gmail.com', '9393939393', 'IT Support', 28000.00),
(8, 'Sundar', 'sundar@gmail.com', '9292929292', 'Logistics Head', 55000.00),
(9, 'Kavitha', 'kavitha@gmail.com', '9191919191', 'Customer Service', 26000.00),
(10, 'Dinesh', 'dinesh@gmail.com', '9090909090', 'Driver', 22000.00)

