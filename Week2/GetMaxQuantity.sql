CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity) AS "Max Quantity In Order" FROM Orders;

CALL GetMaxQuantity();