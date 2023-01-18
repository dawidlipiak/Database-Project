CREATE TABLE Addresses(
address_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
street varchar(40) NOT NULL,
city varchar(30),
zip_code char(6) );

INSERT INTO Addresses VALUES (1,'Zapomnienia 13', 'Wroclaw', '50-233');
INSERT INTO Addresses VALUES (2,'Tragiczna 6/6', 'Wroclaw', '51-522');
INSERT INTO Addresses VALUES (3,'Sloneczna 19', 'Warszawa', '11-213');
