CREATE TABLE Vehicles (
registration_number varchar(8) NOT NULL PRIMARY KEY,
category char(1) NOT NULL,
FOREIGN KEY (category)
REFERENCES Categories (category), 
vehicle_type varchar(15) NOT NULL,
brand varchar(20) NOT NULL,
model varchar(30) NOT NULL,
color varchar(30) NOT NULL,
production_year int NOT NULL,
engine_capasity varchar(30) NOT NULL,
CHECK (production_year BETWEEN 1900 AND 3000));


INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('PP71229','A','car','Lamborghini', 'Reventón', 'Maroon', 2008, '2733 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('FNW5653','E','car','Mitsubishi', 'Truck', 'Pink', 1992, '1532 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('WPZ2608','C','car','Audi', 'S4', 'Fuscia', 2000, '2548 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('BGR3956','B','car','Infiniti', 'FX', 'Indigo', 2005, '2567 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('TKA8248','C','car','Honda', 'CR-V', 'Green', 2003, '1999 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('PLE6461','B','car','Spyker', 'C8', 'Mauv', 2006, '2699 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('WX91744','D','car','Dodge', 'Magnum', 'Goldenrod', 2007, '1499 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('LJA4926','C','car','MINI', 'Cooper Clubman', 'Violet', 2008, '2899 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('KOL2216','D','car','Mitsubishi', 'Eclipse', 'Yellow', 1991, '1316 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('DW2216','D',''car',Ford', 'Focus', 'Turquoise', 2000, '1359 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('CGR1184','C','car','Toyota', 'Avalon', 'Crimson', 2005, '2047 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('PLE6051','B','car','Saturn', 'Outlook', 'Red', 2009, '1652 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('NOE2834','B','car','Jeep', 'Wrangler', 'Red', 1994, '1553 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('EPA4500','C','car','Ford', 'Edge', 'Crimson', 2008, '1318 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('DKA3815','A','car','Audi', 'A6', 'Mauv', 2010, '2692 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('WO69575','A','car','Maserati', 'GranTurismo', 'Maroon', 2010, '2845 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('WX62119','B','car','Chevrolet', 'Colorado', 'Khaki', 2010, '1401 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('ZSW3116','E','car','Mercury', 'Mountaineer', 'Pink', 2000, '2127 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('KWA5300','A','car','GMC', 'Sonoma Club Coupe', 'Goldenrod', '1999 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('FZA2790','E','car','Volkswagen', 'Tiguan', 'Khaki', 2011, '1479 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('TKI6933','E','car','Mercury', 'Cougar', 'Teal', 1987, '2728 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('SZO3675','D','car','Ford', 'EXP', 'Yellow', 1987, '1906 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('WOR8283','A','car','Aston Martin', 'Vantage', 'Fuscia', 2006, '1289 cm3');
INSERT INTO Vehicles(registraGtion_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('RDE5748','E','car','Mercury', 'Mountaineer', 'Indigo', 2006, '2790 cm3');
INSERT INTO Vehicles(registration_number,category,vehicle_type,brand,model,color,production_year,engine_capasity) VALUES('EWE3748','A','car','Dodge', 'Ram', 'Red', 2010, '2499 cm3');

INSERT INTO Vehicles VALUES('RLU4702','B','Motorcycle','Yamaha', 'R1', 'blue',2000,'1000 cm3');
INSERT INTO Vehicles VALUES('SGL8316','C','Motorcycle','Honda', 'CBR 600','black',2005,'600 cm3');
INSERT INTO Vehicles VALUES('BAU4643','D','Motorcycle','Bajaj', 'Dominator','red',2009,'400 cm3');
INSERT INTO Vehicles VALUES('RKR4738','B','Motorcycle','Yamaha', 'mt07','yelow',2010,'700 cm3');
INSERT INTO Vehicles VALUES('STY0787','C','Motorcycle','Suzuki','SV 650N','blue',2006,'649 cm3');