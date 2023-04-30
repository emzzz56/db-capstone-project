DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //
CREATE PROCEDURE AddBooking (IN bookID INT, IN cID INT, IN bDate DATE, IN tableNo INT)
BEGIN
	INSERT INTO Bookings (BookingID, TableNumber, CustomerID, EmployeeID, Date)
	VALUES (bookID, tableNo, cID, 1, bDate);
    SELECT "New Booking Added" AS Confirmation;
    
END//

DELIMITER ;

CALL AddBooking(9, 3, 4, "2022-12-30");