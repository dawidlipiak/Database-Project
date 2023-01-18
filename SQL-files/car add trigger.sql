DELIMITER $$
CREATE TRIGGER vehicleAdd AFTER INSERT ON Vehicles
FOR EACH ROW
BEGIN
    INSERT INTO Vehicles_info(registration_number,rent_state) VALUES (NEW.registration_number,'F');
END$$
DELIMITER ;