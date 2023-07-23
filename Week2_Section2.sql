--Week 2, Section: Table booking system

--Task 1
--Insert Statement
INSERT INTO Bookings VALUES 
(1, '2022-10-10',5, 1), 
(2, '2022-11-12',3, 3),
(3, '2022-10-11',2, 2),
(4, '2022-10-13',2, 1);

--Task 2
--Create a stored procedure
DELIMITER //

CREATE PROCEDURE CheckBooking()
BEGIN
    INSERT INTO Bookings (BookingDate, TableNumber) VALUES (?,?);
END //

DELIMITER;

CALL CheckBooking("2022-11-12",3);

--Task 3
--Create a procedure
DELIMITER //

CREATE PROCEDURE AddValidBooking(IN BDate Date, IN TNumber INT)
BEGIN
    START TRANSACTION;
        IF NOT EXISTS (?,?)
            THEN INSERT INTO Bookings (BookingDate, TableNumber) VALUES (?,?);
            COMMIT;
        ELSE SELECT 'Table is already booked - booking cancelled';
            ROLLBACK;
END //

DELIMITER;

CALL AddValidBooking("2022-12-18", 6);

--Exercise: Create SQL queries to add and update bookings
--Task 1: AddBooking
DELIMITER //

CREATE PROCEDURE AddBooking(IN BkingID INT, IN CxID INT, IN BkDate DATE, IN TbNumber INT)
BEGIN
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber) VALUES (?,?,?,?);    
END //

DELIMITER;

--Task 2:UpdateBooking
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN BkID INT, IN BkDate DATE)
BEGIN 
    UPDATE Bookings
    SET BkID = ? AND BkDate = ?
END //
DELIMITER;

--Task 3: CancelBooking
DELIMITER //
CREATE PROCEDURE CancelBooking(IN BkID INT)
BEGIN
    DELETE FROM Bookings WHERE BookingID = ?;
END //
DELIMITER;