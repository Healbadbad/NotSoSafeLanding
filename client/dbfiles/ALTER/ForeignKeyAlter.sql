use NotSoSafeLanding

-- Alter table City add constraint Country_FK FOREIGN KEY (Country) REFERENCES Country(Name)
-- on update cascade;

-- GO

-- Alter table Plane add constraint Model_FK FOREIGN KEY (Model) REFERENCES PlaneModel(Name)
-- on update cascade;

-- GO

-- Alter table Building
-- add constraint BID_FK FOREIGN KEY (BID) REFERENCES LandingZone(LID);

-- GO


-- Alter table Building
-- add constraint Bname_FK FOREIGN KEY (City) References City(Name); --Weird error

-- GO

-- Alter table Terrain
-- add constraint TID_FK FOREIGN KEY (TID) REFERENCES LandingZone(LID);

-- GO

-- Alter table Airport
-- add constraint AID_FK FOREIGN KEY (AID) REFERENCES LandingZone(LID);

-- GO

Alter table VIP
add constraint Importance_FK FOREIGN KEY (Importance) REFERENCES Impact(IID);

GO

-- Alter table VIPLocation
-- add constraint VIPI_FK FOREIGN KEY (VIP) REFERENCES VIP(VIPID)
-- on update cascade;

-- GO

-- Alter table Landing
-- add constraint PlaneNumber_FK FOREIGN KEY (PlaneNumber) REFERENCES Plane(Number);

-- GO

-- Alter table Plane
-- add constraint DepartingAirport_FK FOREIGN KEY (DepartingAirport) REFERENCES LandingZone(LID);

-- GO

-- Alter table Landing
-- add constraint LZID_FK FOREIGN KEY (LZID) REFERENCES LandingZone(LID);

-- GO

-- Alter table Landing
-- add constraint PlaneNumber_FKL FOREIGN KEY (PlaneNumber) REFERENCES Plane(Number);

-- GO

-- Alter table Landing
-- add constraint IID_FK FOREIGN KEY (IID) REFERENCES Impact(IID);
