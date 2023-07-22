--Week 2, Section: Adding Sales Reports

--Create a virtual table to summarize data
--Task 1
CREATE VIEW OrdersView AS 
SELECT OrderID, Quantity, Cost 
FROM Orders
WHERE Quantity > 2;

--Task 2
SELECT 
c.CustomerID,
c.FullName,
o.OrderID,
o.Cost,
m.MenuName,
i.CourseName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Menus m ON o.MenuID = m.MenuID
LEFT JOIN MenuItems i ON m.MenuItemsID = i.MenuItemsID
ORDER BY Cost;

--Task 3
SELECT MenuName
FROM Menus
WHERE MenuID = ANY (SELECT MenuID FROM Orders WHERE Quantity > 2);

--Create a stored procedure
--Task 1
DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) FROM Orders
END //

DELIMITER;

--Create a prepared statement
--Task 2
PREPARE GetOrderDetail FROM
'SELECT CustomerID, Quantity, TotalCost FROM Orders WHERE CustomerID = ?';
SET @CustomerID = 1;
EXECUTE GetOrderDetail USING @CustomerID;

--Create a stored procedure
--Task 3
DELIMITER //

CREATE PROCEDURE CancelOrder()
BEGIN
    DELETE FROM Orders WHERE OrderID = ?;
    SELECT 'Order '+?' is cancelled.';
END //

DELIMITER;

CALL CancelOrder(5);

--