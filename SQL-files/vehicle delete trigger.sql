DELIMITER $$
CREATE TRIGGER vehicleDelete AFTER DELETE ON Vehicles_info
FOR EACH ROW
BEGIN
    DELETE FROM Vehicles WHERE registration_number = OLD.registration_number; 
END$$
DELIMITER ;