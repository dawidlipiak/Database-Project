CREATE TABLE Vehicles_info ( 
id_vehicle int NOT NULL AUTO_INCREMENT PRIMARY KEY,
registration_number varchar(8) NOT NULL,
rent_state char(1) NOT NULL,
FOREIGN KEY (registration_number)
REFERENCES Vehicles(registration_number));

DELIMITER $$
CREATE TRIGGER registrationTrigger BEFORE INSERT ON Vehicles_info
FOR EACH ROW
BEGIN
    IF((SELECT LENGTH(NEW.registration_number)) NOT BETWEEN 5 AND 7)
    THEN
        SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'Wrong registration number length';
    END IF;
END$$
DELIMITER ;

