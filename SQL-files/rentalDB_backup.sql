-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rental
-- ------------------------------------------------------
-- Server version	10.6.11-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Addresses`
--

DROP TABLE IF EXISTS `Addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Addresses` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(40) NOT NULL,
  `city` varchar(30) DEFAULT NULL,
  `zip_code` char(6) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Addresses`
--

LOCK TABLES `Addresses` WRITE;
/*!40000 ALTER TABLE `Addresses` DISABLE KEYS */;
INSERT INTO `Addresses` VALUES (1,'Zapomnienia 13','Wroclaw','50-233'),(2,'Tragiczna 6/6','Wroclaw','51-522'),(3,'Sloneczna 19','Warszawa','11-213');
/*!40000 ALTER TABLE `Addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categories` (
  `category` char(1) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES ('A',450),('B',400),('C',330),('D',250),('E',110);
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clients` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `pesel` char(11) NOT NULL,
  `birthday` date NOT NULL,
  `street` varchar(40) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip_code` char(6) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `NIP` char(10) DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`phone_number` between 100000000 and 999999999)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES (1,'Andrzej','Stanowski',678876678,'70081489391','1970-08-14','Zalamania 13/13','Krzywe kolano','88-324',NULL,NULL);
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER peselCheck BEFORE INSERT ON Clients
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER addultyCheck BEFORE INSERT ON Clients
FOR EACH ROW
BEGIN
IF (SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),NEW.birthday)),'%Y') + 0 AS age) < 18
THEN
    SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'To young to be a client';
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Rentals`
--

DROP TABLE IF EXISTS `Rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rentals` (
  `rental_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `rental_address_id` int(11) NOT NULL,
  `rental_date` date NOT NULL,
  `return_date` date NOT NULL,
  `total_price` float DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  KEY `client_id` (`client_id`),
  KEY `staff_id` (`staff_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `rental_address_id` (`rental_address_id`),
  CONSTRAINT `Rentals_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Clients` (`id_client`),
  CONSTRAINT `Rentals_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `Staff` (`id_staff`),
  CONSTRAINT `Rentals_ibfk_3` FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicles_info` (`id_vehicle`),
  CONSTRAINT `Rentals_ibfk_4` FOREIGN KEY (`rental_address_id`) REFERENCES `Addresses` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rentals`
--

LOCK TABLES `Rentals` WRITE;
/*!40000 ALTER TABLE `Rentals` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rentals` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER rentStateTrigger AFTER INSERT ON Rentals
FOR EACH ROW
BEGIN
    UPDATE Vehicles_info SET rent_state = 'U' WHERE NEW.vehicle_id = vehicle_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `id_staff` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `street` varchar(40) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip_code` char(6) NOT NULL,
  `phone_number` int(11) NOT NULL,
  PRIMARY KEY (`id_staff`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`phone_number` between 100000000 and 999999999)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,'Dawid','Lipiak','Szczesliwa 69a','Niemyje-Zabki','23-691',691236123);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicles`
--

DROP TABLE IF EXISTS `Vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehicles` (
  `registration_number` varchar(8) NOT NULL,
  `category` char(1) NOT NULL,
  `vehicle_type` varchar(15) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `model` varchar(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `production_year` int(11) NOT NULL,
  `engine_capasity` varchar(30) NOT NULL,
  PRIMARY KEY (`registration_number`),
  KEY `category` (`category`),
  CONSTRAINT `Vehicles_ibfk_1` FOREIGN KEY (`category`) REFERENCES `Categories` (`category`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`production_year` between 1900 and 3000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicles`
--

LOCK TABLES `Vehicles` WRITE;
/*!40000 ALTER TABLE `Vehicles` DISABLE KEYS */;
INSERT INTO `Vehicles` VALUES ('BAU4643','D','Motorcycle','Bajaj','Dominator','red',2009,'400 cm3'),('BGR3956','B','car','Infiniti','FX','Indigo',2005,'2567 cm3'),('CGR1184','C','car','Toyota','Avalon','Crimson',2005,'2047 cm3'),('DKA3815','A','car','Audi','A6','Mauv',2010,'2692 cm3'),('EPA4500','C','car','Ford','Edge','Crimson',2008,'1318 cm3'),('EWE3748','A','car','Dodge','Ram','Red',2010,'2499 cm3'),('FNW5653','E','car','Mitsubishi','Truck','Pink',1992,'1532 cm3'),('FZA2790','E','car','Volkswagen','Tiguan','Khaki',2011,'1479 cm3'),('KOL2216','D','car','Mitsubishi','Eclipse','Yellow',1991,'1316 cm3'),('LJA4926','C','car','MINI','Cooper Clubman','Violet',2008,'2899 cm3'),('NOE2834','B','car','Jeep','Wrangler','Red',1994,'1553 cm3'),('PLE6051','B','car','Saturn','Outlook','Red',2009,'1652 cm3'),('PLE6461','B','car','Spyker','C8','Mauv',2006,'2699 cm3'),('PP71229','A','car','Lamborghini','Reventón','Maroon',2008,'2733 cm3'),('RDE5748','E','car','Mercury','Mountaineer','Indigo',2006,'2790 cm3'),('RKR4738','B','Motorcycle','Yamaha','mt07','yelow',2010,'700 cm3'),('RLU4702','B','Motorcycle','Yamaha','R1','blue',2000,'1000 cm3'),('SGL8316','C','Motorcycle','Honda','CBR 600','black',2005,'600 cm3'),('STY0787','C','Motorcycle','Suzuki','SV 650N','blue',2006,'649 cm3'),('SZO3675','D','car','Ford','EXP','Yellow',1987,'1906 cm3'),('TKA8248','C','car','Honda','CR-V','Green',2003,'1999 cm3'),('TKI6933','E','car','Mercury','Cougar','Teal',1987,'2728 cm3'),('WO69575','A','car','Maserati','GranTurismo','Maroon',2010,'2845 cm3'),('WOR8283','A','car','Aston Martin','Vantage','Fuscia',2006,'1289 cm3'),('WPZ2608','C','car','Audi','S4','Fuscia',2000,'2548 cm3'),('WX62119','B','car','Chevrolet','Colorado','Khaki',2010,'1401 cm3'),('WX91744','D','car','Dodge','Magnum','Goldenrod',2007,'1499 cm3'),('ZSW3116','E','car','Mercury','Mountaineer','Pink',2000,'2127 cm3');
/*!40000 ALTER TABLE `Vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER vehicleAdd AFTER INSERT ON Vehicles
FOR EACH ROW
BEGIN
    INSERT INTO Vehicles_info(registration_number,rent_state) VALUES (NEW.registration_number,'F');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Vehicles_info`
--

DROP TABLE IF EXISTS `Vehicles_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vehicles_info` (
  `id_vehicle` int(11) NOT NULL AUTO_INCREMENT,
  `registration_number` varchar(8) NOT NULL,
  `rent_state` char(1) NOT NULL,
  PRIMARY KEY (`id_vehicle`),
  KEY `registration_number` (`registration_number`),
  CONSTRAINT `Vehicles_info_ibfk_1` FOREIGN KEY (`registration_number`) REFERENCES `Vehicles` (`registration_number`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicles_info`
--

LOCK TABLES `Vehicles_info` WRITE;
/*!40000 ALTER TABLE `Vehicles_info` DISABLE KEYS */;
INSERT INTO `Vehicles_info` VALUES (1,'PP71229','F'),(2,'FNW5653','F'),(3,'WPZ2608','F'),(4,'BGR3956','F'),(5,'TKA8248','F'),(6,'PLE6461','F'),(7,'WX91744','F'),(8,'LJA4926','F'),(9,'KOL2216','F'),(10,'CGR1184','F'),(11,'PLE6051','F'),(12,'NOE2834','F'),(13,'EPA4500','F'),(14,'DKA3815','F'),(15,'WO69575','F'),(16,'WX62119','F'),(17,'ZSW3116','F'),(18,'FZA2790','F'),(19,'TKI6933','F'),(20,'SZO3675','F'),(21,'WOR8283','F'),(22,'RDE5748','F'),(23,'EWE3748','F'),(24,'RLU4702','F'),(25,'SGL8316','F'),(26,'BAU4643','F'),(27,'RKR4738','F'),(28,'STY0787','F');
/*!40000 ALTER TABLE `Vehicles_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER registrationTrigger BEFORE INSERT ON Vehicles_info
FOR EACH ROW
BEGIN
    IF((SELECT LENGTH(NEW.registration_number)) NOT BETWEEN 5 AND 7)
    THEN
        SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'Wrong registration number length';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER vehicleDelete AFTER DELETE ON Vehicles_info
FOR EACH ROW
BEGIN
    DELETE FROM Vehicles WHERE registration_number = OLD.registration_number; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-17 11:55:05
