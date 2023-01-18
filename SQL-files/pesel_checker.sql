DELIMITER $$
CREATE FUNCTION controlNo(pesel CHAR(11)) RETURNS int DETERMINISTIC
BEGIN 
    DECLARE sumNr INT DEFAULT 0;
    SET sumNr = sumNr + (1 * CAST(SUBSTRING(pesel, 1, 1) AS int ));
    SET sumNr = sumNr + (3 * CAST(SUBSTRING(pesel, 2, 1) AS int ));
    SET sumNr = sumNr + (7 * CAST(SUBSTRING(pesel, 3, 1) AS int ));
    SET sumNr = sumNr + (9 * CAST(SUBSTRING(pesel, 4, 1) AS int ));
    SET sumNr = sumNr + (1 * CAST(SUBSTRING(pesel, 5, 1) AS int ));
    SET sumNr = sumNr + (3 * CAST(SUBSTRING(pesel, 6, 1) AS int ));
    SET sumNr = sumNr + (7 * CAST(SUBSTRING(pesel, 7, 1) AS int ));
    SET sumNr = sumNr + (9 * CAST(SUBSTRING(pesel, 8, 1) AS int ));
    SET sumNr = sumNr + (1 * CAST(SUBSTRING(pesel, 9, 1) AS int ));
    SET sumNr = sumNr + (3 * CAST(SUBSTRING(pesel, 10, 1) AS int ));

    return (10-(sumNr %10))%10;
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION checkPeselDate(pesel CHAR(11), birthday date) RETURNS boolean
BEGIN
    DECLARE MM char(2);
    DECLARE rok char(2);
    IF YEAR(birthday) >= 2000
    THEN
        SET MM = CAST(SUBSTRING(pesel,3,2) AS int) % 20;
        SET rok = '20';
    ELSE
        SET MM = SUBSTRING(pesel,3,2);
        SET rok = '19'; 
    END IF;

    IF CONCAT(rok,SUBSTRING(pesel, 1, 2),'-',CAST(MM as char),'-',SUBSTRING(pesel,5,2)) = birthday
    THEN    
        return TRUE;
    ELSE
        return FALSE;
    END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER peselCheck BEFORE INSERT ON Clients
FOR EACH ROW
BEGIN
    DECLARE correctPesel char(11);

    IF (SELECT LENGTH(NEW.pesel)) <>  11
    THEN
        SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'Wrong pesel length';
    END IF;

    IF (SELECT checkPeselDate(NEW.pesel, NEW.birthday) = FALSE)
    THEN
        SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'Wrong date in pesel';
    END IF;
    
    IF (SELECT controlNo(NEW.pesel)) <> SUBSTRING(NEW.pesel,11,1)
    THEN
        SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'Wrong control number in pesel';
    END IF;
END$$
DELIMITER ;