DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN bookID INT, IN bDate DATE)
BEGIN
UPDATE Bookings SET Date = bDate WHERE BookingID = bookID;
SELECT CONCAT("Booking ", bookID, " updated") AS Confirmation;
END//

DELIMITER ;
CALL UpdateBooking(9, "2022-12-17");
SELECT * FROM Bookings;