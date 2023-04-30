DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //
CREATE PROCEDURE AddValidBooking(IN bookDate DATE, IN tableNo INT)
BEGIN
		START TRANSACTION;
        SELECT COUNT(BookingID) INTO @status FROM Bookings WHERE DATE=bookDate AND TableNumber = tableNo;
		INSERT INTO Bookings (TableNumber, CustomerID, EmployeeID, Date) 
        VALUES (tableNo , 1 , 1 , bookDate);
		IF @status > 0 THEN 
			ROLLBACK; 
			SELECT CONCAT("Table ",tableNo," is already booked - Booking Cancelled") AS "Booking Status";
		ELSE
			COMMIT;
			SELECT CONCAT("Table ",tableNo," is not booked - Booking Done") AS "Booking Status";
		END IF;
END//

DELIMITER ;

CALL AddValidBooking("2022-12-17", 6);