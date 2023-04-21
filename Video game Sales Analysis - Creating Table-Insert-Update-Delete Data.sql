-- Original Source: https://www.vgchartz.com/charts/platform_totals/Hardware.php/

use dataproject; 


select * from vgsales1;

create table HardwareData1 (
platform varchar(50),
North_America float,
Europe float,
Japan float,
Other_Sales float,
Global_Sales float)

INSERT INTO HardwareData1 Values ( 'PS2', '53.65','55.28','23.18','26.59','158.70')
INSERT INTO HardwareData1 values ('DS', '57.92', '51.84','32.99', '11.28', '154.02')
INSERT INTO HardwareData1 Values ('Switch', '44.60', '31.56', '28.71', '19.04', '123.91')
INSERT INTO HardwareData1 values ('Game Boy', '43.18', '40.05', '32.47', '2.99', '118.69')
INSERT INTO HardwareData1 values ('Playstation 4', '38.14', '45.83', '9.61', '23.43', '117.02')
INSERT INTO HardwareData1 Values ('Playstation', '40.78', '31.09', '21.59', '9.04', '102.49')
INSERT INTO HardwareData1 values ('Nintendo Wii', '45.51','33.12', '12.77','10.23', '101.63')
INSERT INTO HardwareData1 values ('Playstation 3', '29.92', '30.87', '10.47', '16.14','87.40')
INSERT INTO HardwareData1 values ('Xbox 360', '47.09','25.08','1.66','11.90', '85.73')
INSERT INTO HardwareData1 values ('Game Boy Advance', '40.39', '21.31', '16.96', '2.85','81.51')

-- Replace Playstation 4 with PS4, Game boy advance with GBA, Playstation with PS as the platform names. 

UPDATE HardwareData1 
SET platform = 'PS4'
where platform = 'Playstation 4'

UPDATE HardwareData1
SET platform = 'GBA'
where platform = 'Game Boy Advance'

UPDATE HardwareData1
SET platform = 'PS'
where platform = 'Playstation'

-- Delete the Hardware Sales for the Switch and Gameboy

DELETE from HardwareData1 where platform = 'Switch' 
DELETE from HardwareData1 where platform = 'Game Boy' 







