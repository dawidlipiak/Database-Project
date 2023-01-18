CREATE TABLE Rentals(
rental_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,

client_id int NOT NULL,
FOREIGN KEY (client_id)
REFERENCES Clients (id_client),

staff_id int NOT NULL,
FOREIGN KEY (staff_id)
REFERENCES Staff (id_staff),

vehicle_id int NOT NULL,
FOREIGN KEY (vehicle_id)
REFERENCES Vehicles_info(id_vehicle), 

rental_address_id int NOT NULL,
FOREIGN KEY (rental_address_id)
REFERENCES Addresses(address_id),

rental_date DATE NOT NULL,
return_date DATE NOT NULL,
total_price float);
