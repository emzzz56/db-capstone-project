
INSERT INTO MenuItems (MenuItemID, CourseName, Type, Price)
VALUES
(1,'Olives','Starters',5),
(2,'Flatbread','Starters', 5),
(3, 'Minestrone', 'Starters', 8),
(4, 'Tomato bread','Starters', 8),
(5, 'Falafel', 'Starters', 7),
(6, 'Hummus', 'Starters', 5),
(7, 'Greek salad', 'Main Courses', 15),
(8, 'Bean soup', 'Main Courses', 12),
(9, 'Pizza', 'Main Courses', 15),
(10,'Greek yoghurt','Desserts', 7),
(11, 'Ice cream', 'Desserts', 6),
(12, 'Cheesecake', 'Desserts', 4),
(13, 'Athens White wine', 'Drinks', 25),
(14, 'Corfu Red Wine', 'Drinks', 30),
(15, 'Turkish Coffee', 'Drinks', 10),
(16, 'Turkish Coffee', 'Drinks', 10),
(17, 'Kabasa', 'Main Courses', 17);


INSERT INTO Menus (MenuID, MenuItemID, Title, Cuisine)
VALUES
(1, 1, 'Greek Menu', 'Greek'),
(2, 7, 'Greek Menu', 'Greek'),
(3, 10, 'Greek Menu', 'Greek'),
(4, 13, 'Greek Menu', 'Greek'),
(5, 3, 'Italian Menu', 'Italian'),
(6, 9, 'Italian Menu', 'Italian'),
(7, 12, 'Italian Menu', 'Italian'),
(8, 15, 'Italian Menu', 'Italian'),
(9, 5, 'Special Menu', 'Turkish'),
(10, 17, 'Special Menu', 'Turkish'),
(11, 11, 'Special Menu', 'Turkish'),
(12, 16, 'Special Menu', 'Turkish');


INSERT INTO Customers(CustomerID, FirstName, LastName, Email, Phone) VALUES 
(1,'Anna','Iversen','customer1@finalpro.com','5566778899'),
(2,'Joakim', 'Iversen','customer2@finalpro.com','0099887722'),
(3,'Vanessa', 'McCarthy','customer3@finalpro.com','9846532229'),
(4,'Marcos', 'Romero','customer3@finalpro.com','1830998576'),
(5,'Hiroki', 'Yamane','customer4@finalpro.com','8734528905'),
(6,'Diana', 'Pinto','customer5@finalpro.com','8846790308');

INSERT INTO Staff (StaffID, FullName, Role, Address, Phone, Email, Salary)
VALUES
(1,'Mario Gollini','Manager','724, Parsley Lane, Old Town, Chicago, IL','351258074','Mario.g@littlelemon.com',70000),
(2,'Adrian Gollini','Assistant Manager','334, Dill Square, Lincoln Park, Chicago, IL','351474048','Adrian.g@littlelemon.com',65000),
(3,'Giorgos Dioudis','Head Chef','879 Sage Street, West Loop, Chicago, IL','351970582','Giorgos.d@littlelemon.com',50000),
(4,'Fatma Kaya','Assistant Chef','132  Bay Lane, Chicago, IL','351963569','Fatma.k@littlelemon.com',45000),
(5,'Elena Salvai','Head Waiter','989 Thyme Square, EdgeWater, Chicago, IL','351074198','Elena.s@littlelemon.com',40000),
(6,'John Millar','Receptionist','245 Dill Square, Lincoln Park, Chicago, IL','351584508','John.m@littlelemon.com',35000);

INSERT INTO Bookings (BookingID, TableNumber, CustomerID, BookingSlot, EmployeeID, Date)
VALUES
(1,12,1,'19:00:00',1, '2023/5/4'),
(2, 12,2, '19:00:00',2, '2023/5/4'),
(3, 19,3, '15:00:00',3, '2023/5/20'),
(4, 15,4, '17:30:00',4, '2023/5/21'),
(5, 5,5 , '18:30:00',5, '2023/5/23'),
(6, 8,6 , '20:00:00',6, '2023/5/28');


INSERT INTO Delivery (DeliveryID, Date, Status)
VALUES
(1, '2023/5/4', 'PENDING'),
(2, '2023/5/4', 'DELIVERED'),
(3, '2023/5/4', 'IN PROGRESS'),
(4, '2023/5/4', 'PENDING'),
(5, '2023/5/4', 'IN PROGRESS'),
(6, '2023/5/4', 'DELIVERED'),
(7, '2023/5/4', 'DELIVERED');



INSERT INTO Orders (OrderID, CustomerID, MenuID, BookingID, Quantity, TotalCost, Date, DeliveryID)
VALUES
(1,1, 12, 1, 1, 186, '2023/5/4', 1),
(2,2, 11, 2, 2, 37, '2023/5/4', 2),
(3,1, 12, 2, 3, 37, '2023/5/4', 3),
(4,3, 5, 1, 4, 240, '2023/5/4', 4),
(5,4, 8, 1, 5, 43, '2023/5/4', 5),
(6,5, 10, 1, 5, 170, '2023/5/4', 6),
(7,4, 12, 1, 5, 143, '2023/5/4', 6),
(8,6, 2, 1, 5, 100, '2023/5/4', 7);




