CREATE TABLE Staff (
    id_staff int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstName varchar(30) NOT NULL,
    lastName varchar(30) NOT NULL,
    street varchar(40) NOT NULL,
    city varchar(30) NOT NULL,
    zip_code char(6) NOT NULL,
    phone_number int NOT NULL,
    CHECK (phone_number BETWEEN 100000000 AND 999999999));
'59-900'
insert into Staff (id_staff, firstName, lastName, street, city,zip_code, phone_number) values (1, 'Dawid', 'Lipiak','Szczesliwa 69a','Niemyje-Zabki','23-691',691236123);

