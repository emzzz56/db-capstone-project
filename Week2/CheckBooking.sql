DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //
CREATE PROCEDURE CheckBooking(IN bookDate DATE, IN tableNo INT)
BEGIN
	
	SELECT COUNT(BookingID) INTO @status FROM Bookings WHERE DATE=bookDate AND TableNumber = tableNo;
    IF @status > 0 THEN 
		SELECT CONCAT("Table ",tableNo," is already booked") AS "Booking Status";
	ELSE
		SELECT CONCAT("Table ",tableNo," is not booked") AS "Booking Status";
	END IF;
END//

DELIMITER ;

CALL CheckBooking("2022-11-12", 3);