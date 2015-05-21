use NotSoSafeLanding

DROP TABLE IF EXISTS DummyLandingZone;
Create table DummyLandingZone
(
LID int AUTO_INCREMENT NOT NULL,
Name char(50),
ChanceOfSurvival int NOT NULL,
GPSX float NOT NULL,
GPSY float NOT NULL,
IID varchar(50),
PRIMARY KEY (LID)
);

	DROP TABLE IF EXISTS DummyBuilding;
	Create table DummyBuilding
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

	DROP TABLE IF EXISTS DummyTerrain;
	Create table DummyTerrain
	(
	TID int AUTO_INCREMENT NOT NULL,
	TType char(50) NOT NULL,
	flatness int NOT NULL,
	GPSX float NOT NULL,
	GPSY float NOT NULL,
	IID int,
	PRIMARY KEY (TID)
	);

	DROP TABLE IF EXISTS DummyAirport;
	Create table DummyAirport
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

-- DROP TABLE IF EXISTS VIP;
-- Create table VIP
-- (
-- Name char(50) NOT NULL,
-- PositionX float,
-- PositionY float,
-- Age int,
-- Importance varchar(50) NOT NULL,
-- VIPID int AUTO_INCREMENT NOT NULL,
-- PRIMARY KEY (VIPID)
-- );

-- DROP TABLE IF EXISTS VIPLocation;
-- Create table VIPLocation
-- (
-- VIP int NOT NULL,
-- GPSX float,
-- GPSY float,
-- TS DATETIME,
-- PRIMARY KEY (VIP)
-- );

DROP TABLE IF EXISTS DummyImpact;
Create table DummyImpact
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