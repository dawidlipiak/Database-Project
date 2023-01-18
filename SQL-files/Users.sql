CREATE USER 'admin'@'localhost' IDENTIFIED BY "admin";
GRANT ALL ON rental TO 'admin'@'localhost' IDENTIFIED BY "admin";
FLUSH PRIVILEGES;

CREATE USER 'client'@'localhost' IDENTIFIED BY "client";
GRANT SELECT ON rental.Vehicles TO 'client'@'localhost' IDENTIFIED BY "client";
GRANT SELECT ON rental.Vehicles_info TO 'client'@'localhost' IDENTIFIED BY "client";
FLUSH PRIVILEGES;

CREATE USER 'staff'@'localhost' IDENTIFIED BY "staff";
GRANT SELECT,INSERT,UPDATE ON rental.* TO 'staff'@'localhost' IDENTIFIED BY "staff";
FLUSH PRIVILEGES;
