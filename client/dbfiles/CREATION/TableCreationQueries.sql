use NotSoSafeLanding

DROP TABLE IF EXISTS City;
Create table City
(
ID int NOT NULL AUTO_INCREMENT,
Name char(50) NOT NULL,
Population int NOT NULL,
Size int NOT NULL,
Worth int NOT NULL,
PopulationDensity int NOT NULL,
Country char(50) NOT NULL,
PRIMARY KEY (ID)
);

-- DROP TABLE IF EXISTS Plane;
-- Create table Plane
-- (
-- Number int NOT NULL,
-- Model varchar(50) NOT NULL,
-- Airline char(50),
-- DepartingAirport int NOT NULL,
-- PRIMARY KEY (Number)
-- );

DROP TABLE IF EXISTS PlaneModel;
Create table PlaneModel
(
Name varchar(50) NOT NULL,
Capacity int,
FuelCapacity int,
DistanceCoverable int,
Cost int,
Manufacturer char(50),
Integrity int NOT NULL,
PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS LandingZone;
Create table LandingZone
(
LID int AUTO_INCREMENT NOT NULL,
Name char(50),
ChanceOfSurvival int NOT NULL,
GPSX float NOT NULL,
GPSY float NOT NULL,
IID varchar(50),
PRIMARY KEY (LID)
);

	DROP TABLE IF EXISTS Building;
	Create table Building
	(
	BID varchar(50) NOT NULL,
	Name char(50) NOT NULL,
	Area int NOT NULL,
	Capacity int NOT NULL,
	City char(50) NOT NULL,
	holder char(50),
	Value int NOT NULL,
	SIntegrity int NOT NULL,
	GPSX float NOT NULL,
	GPSY float NOT NULL,
	IID varchar(50),
	PRIMARY KEY (BID)
	);

	DROP TABLE IF EXISTS Terrain;
	Create table Terrain
	(
	TID int AUTO_INCREMENT NOT NULL,
	TType char(50) NOT NULL,
	flatness int NOT NULL,
	GPSX float NOT NULL,
	GPSY float NOT NULL,
	IID int,
	PRIMARY KEY (TID)
	);

	DROP TABLE IF EXISTS Airport;
	Create table Airport
	(
	AID varchar(50) NOT NULL,
	Name varchar(50),
	Zip int NOT NULL,
	Terminals int,
	GPSX float NOT NULL,
	GPSY float NOT NULL,
	IID varchar(50),
	PRIMARY KEY (AID)
	);

DROP TABLE IF EXISTS Country;
Create table Country
(
Name char(50) NOT NULL,
CValue int NOT NULL,
GDP int,
DangerLvl int,
Area int,
CCratio int NOT NULL,
PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS VIP;
Create table VIP
(
Name char(50) NOT NULL,
PositionX float,
PositionY float,
Age int,
Importance varchar(50) NOT NULL,
VIPID int AUTO_INCREMENT NOT NULL,
PRIMARY KEY (VIPID)
);

-- DROP TABLE IF EXISTS VIPLocation;
-- Create table VIPLocation
-- (
-- VIP int NOT NULL,
-- GPSX float,
-- GPSY float,
-- TS DATETIME,
-- PRIMARY KEY (VIP)
-- );

DROP TABLE IF EXISTS Impact;
Create table Impact
(
Political int,
International int,
Monetary int,
Emotional int,
IID varchar(50) NOT NULL,
PRIMARY KEY (IID)
);

-- DROP TABLE IF EXISTS Landing;
-- Create table Landing
-- (
-- PlaneNumber int NOT NULL,
-- LZID int NOT NULL,
-- IID int NOT NULL
-- );