use NotSoSafeLanding
go


insert into Country (Name, CValue, GDP, DangerLvl, Area, CCratio) values
('USA', 1000, 800, 8, 3000, 3),
('India', 900, 900, 8, 8000, 4);

GO

insert into City (Name, Population, Size, Worth, PopulationDensity, Country) values 
('Terre Haute', 1000 ,500, 1000, 10, 'USA'),
('Rome', 2000, 300, 100, 20, 'Italy'),
('New York', 900, 900, 900, 900, 'USA'),
('London', 1200, 50, 480, 80, 'England');

GO

-- insert into Plane (Number, Model, Airline, DepartingAirport) values
-- (135, 'A380', 'United', 3),
-- (136, '747', 'American Airlines', 4);

-- GO

insert into PlaneModel (Name, Capacity, FuelCapacity, DistanceCoverable, Cost, Manufacturer, Integrity) values
('A380', 200, 3000, 7000, 10, 'Airbus', 8),
('747', 190, 2800, 7000, 9, 'Boeing', 9),
('NithinPlane', 500, 5000, 100000, 50, 'NITHIN INDUSTRIES', 15),
('RC', 1, 2, 300, 1, 'RC plane guys', 1),
('JEREMYSUCKS', 80, 1000, 800, 2, 'JEREMYSUCKSINDUSTRIES', 3);

GO

insert into Airport (AID, Name, Zip, Terminals, GPSX, GPSY, IID) values
(2020, 'Terre Haute International Airport', 47901, 5, 23.4532, 25.7333, 400),
(1010, 'Terre Haute International Airport 2', 47809, 5, 23.4333, 25.4444, 401),
(3030, 'Terre Haute International Airport 3', 47801, 5, 23.4444, 25.3333, 402),
(4040, 'Terre Haute International Airport 4', 47800, 5, 23.2121, 25.3322, 403);

GO

insert into LandingZone(Name, ChanceOfSurvival, GPSX, GPSY, LID, IID) values
('AwesomePlace', 2, 80.0952, 90.0888, 1235, 300),
('SecondAwesomePlace', 10, 80.0951, 90.0889, 1236, 301),
('Airport', 10, 80, 90, 1234, 302),
('Building', 10, 100, 110, 1111, 303),
('Place', 4, 80, 90, 1333, 304),
('Building', 10, 50, 50, 2222, 305);

GO

insert into Terrain (TType, flatness, GPSX, GPSY, IID) values
('Rugged', 2, 67.2334, 68.3332, 23),
('Smoky', 5, 55.3221, 68.9984, 25),
('Mountainous', 10, 55.4000, 69.0012, 200);

GO

insert into Building (Name, Area, Capacity, City, holder, Value, SIntegrity, BID, GPSX, GPSY, IID) values
('Union', 45, 1093, 'Terre Haute', 'Nathan Blank', 50, 5, 2224, 39.4771, -87.4138, 100),
('Reddit', 20, 9999, 'Islamabad', 'Jeremy Wright', 65, 10, 2233, 39.4667, -87.4138, 101),
('4channyyy', 80, 100, 'Somewhere in IRAN', 'Other guy', 80, 4, 3323, 39.46667034, -87.41390919, 102),
('Taj Mahal', 100, 100, 'Agra', 'Govt', 100, 8, 9090 , 27.173891, 78.042068, 103);

GO

insert into Impact (Political, International, Monetary, Emotional, IID) values
(8, 9, 5, 9, 1020),
(3, 5, 7, 9, 1002),
(2, 3, 4, 5, 2040);

GO
insert into VIP (Name, PositionX, PositionY, Age, Importance, VIPID) values
('OtherNathan', 39.4693, -87.3895, 12, 100, 12345678),
('lololol', 39.4693, -87.3895, 12, 100, 1000000);

