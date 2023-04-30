DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(IN bookID INT)
BEGIN
	DELETE FROM Bookings WHERE BookingID = bookID;
    SELECT CONCAT("Booking ", bookID, " Cancelled") AS Confirmation;
END//

DELIMITER ;

CALL CancelBooking(9);
SELECT * FROM Bookings;