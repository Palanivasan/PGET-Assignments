CREATE DATABASE TechShop

USE TechShop

/* Customers Table */

CREATE TABLE Customers (
   CustomerID INT CONSTRAINT pk_cid PRIMARY KEY (CustomerID),
   FirstName VARCHAR(100) NOT NULL,
   LastName VARCHAR(100),
   Email VARCHAR(255) NOT NULL UNIQUE,
   Phone BIGINT CHECK (Phone LIKE '[6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
   Address VARCHAR(max)
  )

/* Products TABLE */

CREATE TABLE Products (
   ProductID INT CONSTRAINT pk_pid PRIMARY KEY (ProductID),
   ProductName VARCHAR(100) NOT NULL,
   Description VARCHAR(max),
   Price MONEY NOT NULL CHECK (Price > 0)
  )

/* Orders Table */

CREATE TABLE Orders (
   OrderID INT CONSTRAINT pk_oid PRIMARY KEY (OrderID),
   CustomerID INT CONSTRAINT fk_cid FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
   OrderDate DATE NOT NULL,
   TotalAmount MONEY NOT NULL
  )

/* OrderDetails Table */

CREATE TABLE OrderDetails (
   OrderDetailID INT CONSTRAINT pk_odid PRIMARY KEY (OrderDetailID),
   OrderID INT CONSTRAINT fk_oid FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
   ProductID INT CONSTRAINT fk_pid FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
   QUANTITY INT
  )

/* Inventory Table */

CREATE TABLE Inventory (
    InventoryID INT CONSTRAINT pk_inv_id PRIMARY KEY (InventoryID),
    ProductID INT CONSTRAINT fk_prod_id FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    QuantityInStock INT,
    LastStockUpdate DATETIME,
  )

/* Records Insertion - Customers Table */

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(1, 'Kiran', 'Raj', 'kiranraj@gmail.com', 9876543210, 'Chennai, India'),
(2, 'Palani', 'Vasan', 'palanivasan@gmail.com', 8765432109, 'Trichy, India'),
(3, 'Vijay', 'Kumar', 'vijaykumar@gmail.com', 7654321098, 'Madurai, India'),
(4, 'Arun', 'Giri', 'arungiri@gmail.com', 6543210987, 'Coimbatore, India'),
(5, 'Aathik', 'Roshan', 'aathikroshan@gmail.com', 9988776655, 'Erode, India'),
(6, 'Priya', 'Natarajan', 'priyanatarajan@gmail.com', 9898776654, 'Chennai, India'),
(7, 'Suresh', 'Bala', 'sureshbala@gmail.com', 9444556677, 'Salem, India'),
(8, 'Deepa', 'Rajendran', 'deeparajendran@gmail.com', 9555444433, 'Tirunelveli, India'),
(9, 'Ravi', 'Muthu', 'ravimuthu@gmail.com', 9222333444, 'Vellore, India'),
(10, 'Anjali', 'Ravi', 'anjali@gmail.com', 9333222211, 'Puducherry India')

/* Records Insertion - Products Table */

INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1, 'Laptop', '14-inch screen, 8GB RAM, 512GB SSD', 49999.00),
(2, 'Smartphone', '6.5-inch display, 128GB storage, 6GB RAM', 25999.00),
(3, 'Wireless Mouse', 'Wireless, long battery life', 1199.00),
(4, 'Keyboard', 'RGB lights, wireless', 3699.00),
(5, 'Bluetooth Speaker', 'Portable, 10 hours battery life', 2500.00),
(6, 'Noise Cancelling Headphones', 'Wireless, great sound quality', 5000.00),
(7, 'External Hard Drive', '1TB storage, USB 3.0', 4500.00),
(8, 'Smartwatch', 'Waterproof, 7-day battery life', 7000.00),
(9, 'Tablet', '10-inch screen, 64GB storage, 4GB RAM', 15500.00),
(10, 'Webcam', '1080p HD resolution, USB connection', 1800.00)

/* Records Insertion - Orders Table */

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '01-03-2025', 19000.00),
(2, 2, '03-03-2025', 15500.00),
(3, 3, '04-03-2025', 18500.00),
(4, 4, '05-03-2025', 22000.00),
(5, 5, '06-03-2025', 10200.00),
(6, 6, '07-03-2025', 6200.00),
(7, 7, '08-03-2025', 16000.00),
(8, 8, '09-03-2025', 7500000.00),
(9, 9, '10-03-2025', 11000.00),
(10, 10, '11-03-2025', 11300.00)

/* Records Insertion - OrderDetails Table */

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 3),
(4, 2, 4, 1),
(5, 3, 5, 2),
(6, 3, 6, 1),
(7, 4, 7, 1),
(8, 4, 8, 2),
(9, 5, 9, 3),
(10, 5, 10, 1)

/* Records Insertion - OrderDetails Table */

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 1, 50, '01-03-2025'),
(2, 2, 30, '02-03-2025'),
(3, 3, 100, '03-03-2025'),
(4, 4, 20, '04-03-2025'),
(5, 5, 75, '05-03-2025'),
(6, 6, 60, '06-03-2025'),
(7, 7, 45, '07-03-2025'),
(8, 8, 25, '08-03-2025'),
(9, 9, 90, '09-03-2025'),
(10, 10, 50, '10-03-2025')


