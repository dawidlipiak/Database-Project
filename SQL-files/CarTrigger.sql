DELIMITER $$
CREATE TRIGGER rentStateTrigger AFTER INSERT ON Rentals
FOR EACH ROW
BEGIN
    UPDATE Vehicles_info SET rent_state = 'U' WHERE NEW.vehicle_id = vehicle_id;
END$$
DELIMITER ;