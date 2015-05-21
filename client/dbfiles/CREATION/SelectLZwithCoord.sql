use NotSoSafeLanding

Create Procedure LZbyCoord (polygon varchar(50))
begin
    Select * From LandingZone
    Where LandingZone.GPSPolygon=polygon
end;

Create Procedure ImpactInfo (impactid int)
begin
    Select * from Impact
    Where Impact.IID=impactid
end;