use NotSoSafeLanding

drop procedure if exists LogInsert;
CREATE PROCEDURE LogInsert
	(
	IN Loc VarChar(8000), NumB int
	)

INSERT INTO RequestHistory(Location, NOB, crashstamp) 
VALUES (Loc, NumB, NOW());

GO

drop procedure if exists CountryInsert;
CREATE PROCEDURE CountryInsert
	(
	IN CName char(50), CVal int, GrossDomestic int, Dlvl int, Space int, CCrat int 
	)

INSERT INTO Country(Name, CValue, GDP, Dangerlvl, Area, CCratio) 
VALUES (CName, CVal, GrossDomestic, Dlvl, Space, CCrat);

GO

drop procedure if exists CityInsert;
CREATE PROCEDURE CityInsert
	(
	IN CID int, CName char(50), CPopulation int, CSize int, CWorth int, CPD int, CCountry char(50)
	)

INSERT INTO City(ID, Name, Population, Size, Worth, PopulationDensity, Country)
VALUES (CID, CName, CPopulation, CSize, CWorth, CPD, CCountry);

GO

-- drop procedure if exists PlaneInsert;
-- CREATE PROCEDURE PlaneInsert
-- 	(
-- 	IN PNumber int, PModel varchar(50), PAirline char(50), PDepartingAirport int
-- 	)

-- INSERT INTO Plane(Number, Model, Airline, DepartingAirport)
-- VALUES (PNumber, PModel, PAirline, PDepartingAirport);

-- GO

drop procedure if exists PlaneModelInsert;
CREATE PROCEDURE PlaneModelInsert
	(
	IN PMName varchar(50), PMCapacity int, PMFuelCapacity int, PMDistanceCoverable int, PMCost int, PMManufacturer char(50), PMIntegrity int
	)

INSERT INTO PlaneModel(Name, Capacity, FuelCapacity, DistanceCoverable, Cost, Manufacturer, Integrity)
VALUES (PMName, PMCapacity, PMFuelCapacity, PMDistanceCoverable, PMCost, PMManufacturer, PMIntegrity);

GO

drop procedure if exists LandingZoneInsert;
CREATE PROCEDURE LandingZoneInsert
	(
	IN LZLID int, LZName char(50), LZChanceOfSurvival int, LZGPSX float, LZGPSY float, LZIID int
	)

INSERT INTO LandingZone(LID, Name, ChanceOfSurvival, GPSX, GPSY, IID)
VALUES (LZLID, LZName, LZChanceOfSurvival, LZGPSX, LZGPSY, LZID);

GO

drop procedure if exists BuildingInsert;
CREATE PROCEDURE BuildingInsert
	(
	IN BBID varchar(50), BName char(50), BArea int, BCapacity int, BCity char(50), Bholder char(50), BValue int, BSIntegrity int, BGPSX float, BGPSY float
	)

INSERT INTO Building(BID, Name, Area, Capacity, City, holder, Value, SIntegrity, GPSX, GPSY, IID)
VALUES (BBID, BName, BArea, BCapacity, BCity, Bholder, BValue, BSIntegrity, BGPSX, BGPSY, BBID);

GO

drop procedure if exists TerrainInsert;
CREATE PROCEDURE TerrainInsert
	(
	IN TTID int, TTType char(50), Tflatness int, TGPSX float, TGPSY float, TIID int
	)

INSERT INTO Terrain(TID, TType, flatness, GPSX, GPSY, IID)
VALUES (TTID, TTType, Tflatness, TGPSX, TGPSY, TIID);

GO

drop procedure if exists AirportInsert;
CREATE PROCEDURE AirportInsert
	(
	IN AAID varchar(50), AName varchar(50), AZip int, BGPSX float, BGPSY float
	)

INSERT INTO Airport(AID, Name, Zip, GPSX, GPSY, IID)
VALUES (AAID, AName, AZip, BGPSX, BGPSY, AAID);

GO

drop procedure if exists VIPInsert;
CREATE PROCEDURE VIPInsert
	(
	IN VName char(60), VPositionX float, VPositionY float, VAge int, VImportance int, VVIPID int
	)

INSERT INTO VIP(Name, PositionX, PositionY, Age, Importance, VIPID)
VALUES (VName, VPositionX, VPositionY, VAge, VImportance, VVIPID);

GO

drop procedure if exists VIPLocationInsert;
CREATE PROCEDURE VIPLocationInsert
	(
	IN VIPLVIP int, VIPLGPSX float, VIPLGPSY float, VIPLTS DATETIME
	)

INSERT INTO VIPLocation(VIP, GPSX, GPSY, TS)
VALUES (VIPLVIP, VIPLGPSX, VIPLGPSY, VIPLTS);

GO

drop procedure if exists ImpactInsert;
CREATE PROCEDURE ImpactInsert
	(
	IN IPolitical int, IInternational int, IMonetary int, IEmotional int, IIID int
	)

INSERT INTO Impact(Political, International, Monetary, Emotional, IID)
VALUES (IPolitical, IInternational, IMonetary, IEmotional, IIID);

GO


