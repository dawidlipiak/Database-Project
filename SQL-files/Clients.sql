CREATE TABLE Clients(
id_client int NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name varchar(30) NOT NULL,
last_name varchar(30) NOT NULL,
phone_number int NOT NULL,
pesel char(11) NOT NULL,
birthday date NOT NULL,
street varchar(40) NOT NULL,
city varchar(30) NOT NULL,
zip_code char(6) NOT NULL,
company varchar(50),
NIP char(10),
CHECK (phone_number BETWEEN 100000000 AND 999999999) );

INSERT INTO Clients(first_name,last_name,phone_number,pesel,birthday,street,city,zip_code) VALUES ('Andrzej', 'Stanowski',678876678,'70081489391', '1970-08-14', 'Zalamania 13/13', 'Krzywe kolano','88-324');