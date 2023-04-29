PREPARE GetOrderDetail FROM "SELECT OrderID, Quantity, TotalCost AS Cost FROM Orders WHERE CustomerID = ?";
SET @id = 1;
EXECUTE GetOrderDetail USING @id;