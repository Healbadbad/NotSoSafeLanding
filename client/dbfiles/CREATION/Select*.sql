use NotSoSafeLanding

DROP IF EXISTS Procedure CountryStar();
CREATE Procedure CountryStar() Select * From Country;

GO

DROP IF EXISTS PROCEDURE CityStar();
CREATE Procedure CityStar() Select * From City;

GO

DROP IF EXISTS PROCEDURE AirportStar();
Create Procedure AirportStar() Select * From Airport;

GO

DROP IF EXISTS PROCEDURE BuildingStar();
Create Procedure BuildingStar() Select * From Building;

GO

DROP IF EXISTS PROCEDURE ImpactStar();
Create Procedure ImpactStar() Select * From Impact;

GO

DROP IF EXISTS PROCEDURE LandingStar();
Create Procedure LandingStar() Select * From Landing;

GO

DROP IF EXISTS PROCEDURE LZStar();
Create Procedure LZStar() Select * From LandingZone;

GO

DROP IF EXISTS PROCEDURE PlaneStar();
Create Procedure PlaneStar() Select * From Plane;

GO

DROP IF EXISTS PROCEDURE PMStar();
Create Procedure PMStar() Select * From PlaneModel;

GO

DROP IF EXISTS PROCEDURE RequestHistoryStar();
Create Procedure RequestHistoryStar() Select * From RequestHistory;

GO

DROP IF EXISTS PROCEDURE TerrainStar();
Create Procedure TerrainStar() Select * From Terrain;

GO

DROP IF EXISTS PROCEDURE VIPStar();
Create Procedure VIPStar() Select * From VIP;

GO

DROP IF EXISTS PROCEDURE VIPLStar();
Create Procedure VIPLStar() Select * From VIPLocation;