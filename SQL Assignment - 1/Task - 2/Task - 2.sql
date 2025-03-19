-- 1. Retrieve names and emails of all customers. 

  SELECT FirstName, LastName, Email FROM Customers

-- 2. List all orders with their order dates and customer names. 

  SELECT OrderID, OrderDate, FirstName, LastName
  FROM Orders, CUSTOMERS
  WHERE Orders.CustomerID = CUSTOMERS.CustomerID

-- 3. Insert a new customer record into the Customers table.

  INSERT INTO CUSTOMERS (CustomerID, FirstName, LastName, Email, Phone, Address)
  VALUES (11, 'John', 'Durairaj', 'jd@gmail.com', '9876543763', 'Chennai, India')

-- 4. Update electronic gadgets' prices by 10%. 

  UPDATE Products
  SET Price += (Price / 10)

-- 5. Delete order and details by ID.
  
  DELETE FROM OrderDetails
  WHERE OrderID = 2

  DELETE FROM Orders
  WHERE OrderID = 2

-- 6. Insert new order with customer ID, order date and other info.

  INSERT INTO Orders VALUES (11, 11, '11-03-2025', 50000.00)

-- 7. Update the contact information  of a specific customer.

  UPDATE Customers
  SET Email = 'pv@gmail.com', Address = 'Chennai, India'
  WHERE CustomerID = 2
  
-- 8. Recalculate the TotalAmount for each order based on the prices and quantities. 
  
  UPDATE O
  SET O.TotalAmount = ISNULL(
    (SELECT SUM(P.Price * OD.QUANTITY)
     FROM OrderDetails OD
     INNER JOIN Products P ON OD.ProductID = P.ProductID
     WHERE OD.OrderID = O.TotalAmount), 0)
  FROM Orders O

-- 9. Delete Orders and OrderDetails for a Specific Customer.

  DELETE FROM OrderDetails
  WHERE OrderID = 2

  DELETE FROM Orders
  WHERE CustomerID = 2

-- 10. Insert a New Electronic Gadget Product.
  
  INSERT INTO Products (ProductID, ProductName, Description, Price)
  VALUES (11, 'Smartphone 5G', 'High-quality camera and fast processing speed', 80000.00)

-- 11. Update the Status of a Specific Order.

  ALTER TABLE Orders
  ADD Status Varchar(15) DEFAULT 'Pending'

  UPDATE Orders
  SET Status = 'Shipped'   
  WHERE OrderID = 3

-- 12. Calculate and update the number of orders placed by each customer.

  ALTER TABLE Customers
  ADD NumberOfOrders INT DEFAULT 0;
  
  UPDATE Customers
  SET NumberOfOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
  )









