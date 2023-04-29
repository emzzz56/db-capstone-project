SELECT Customers.CustomerID, CONCAT(Customers.FirstName,' ', Customers.LastName) AS FullName, OrderID, TotalCost AS Cost, 
Menus.Title AS MenuName, MenuItems.CourseName FROM Orders 
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Menus ON Menus.MenuID = Orders.MenuID
INNER JOIN MenuItems ON MenuItems.MenuItemID = Menus.MenuItemID
WHERE Orders.TotalCost > 150
ORDER BY Cost ASC;