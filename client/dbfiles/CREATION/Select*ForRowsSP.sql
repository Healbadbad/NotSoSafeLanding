use NotSoSafeLanding

DROP IF EXISTS Procedure CountrybyPK;
CREATE Procedure CountrybyPK (countryName char(50))
    Select * From Country
    Where Country.Name =countryName;
GO

DROP IF EXISTS PROCEDURE CitybyPK;
CREATE Procedure CitybyPK (Identity varchar(50))
    Select * From City
    Where City.ID=Identity;

GO

DROP IF EXISTS PROCEDURE AirportbyPK;
Create Procedure AirportbyPK (Ident varchar(50))
    Select * From Airport
    Where Airport.AID=Ident;

GO


DROP IF EXISTS PROCEDURE BuildingbyPK;
CREATE Procedure BuildingbyPK (Identity varchar(50))
    Select * From Building
    Where Building.BID=Identity;

GO

DROP IF EXISTS PROCEDURE ImpactByIID;
CREATE Procedure ImpactByIID (ImpID varchar(50))
    Select * From Impact
    Where Impact.IID=ImpID;
    
GO

DROP IF EXISTS PROCEDURE VIPByVIPID;
CREATE Procedure VIPbyVIPID (ImpID varchar(50))
    Select * from Impact
    Where Impact.IID=ImpID;
    
GO

-- DROP IF EXISTS PROCEDURE VIPGPSX;
-- CREATE Procedure VIPGPSX (GPSXCoord float)
--     Select * from VIP
--     Where VIP.PositionX=GPSXCoord;
    
-- GO

-- DROP IF EXISTS PROCEDURE VIPGPSY;
-- CREATE Procedure VIPGPSY (GPSYCoord float)
--     Select * from VIP
--     Where VIP.PositionY=GPSYCoord;
