DELIMITER $$
CREATE PROCEDURE returnChangeState(id int)
BEGIN   
    UPDATE Vehicles_info SET rent_state = 'F' WHERE  id = vehicle_id; 
END$$
DELIMITER;