use NotSoSafeLanding

drop procedure if exists LandingZoneGPSCalc;
delimiter //
CREATE PROCEDURE LandingZoneGPSCalc
	(
	IN LandZGPSX float, LandZGPSY float
	) 
	begin
		Select LID, Name, ChanceOfSurvival, IID, GPSX, GPSY, (3959*acos(cos(radians(LandZGPSX))*cos(radians(GPSX))*cos(radians(GPSY)-radians(LandZGPSY))+
		sin(radians(LandZGPSX)) * sin(radians(GPSX) ))) AS distance
		FROM LandingZone
		HAVING distance < 50
		ORDER BY distance;
	end//

GO

-- drop procedure if exists LandingZoneGPSCalc;
-- delimiter //
-- CREATE PROCEDURE LandingZoneGPSCalc
-- 	(
-- 	IN LandZGPSX float, LandZGPSY float
-- 	) 
-- 	begin
-- 		set @var = LandZGPSX*LandZGPSX + LandZGPSY*LandZGPSY;
-- 		Select * 
-- 		from LandingZone 
-- 		where ((GPSX < LandZGPSX+(SQRT(@var)) 
-- 		and GPSX > LandZGPSX-(SQRT(@var)))
-- 		and (GPSY < LandZGPSY+(SQRT(@var)) 
-- 		and GPSY > LandZGPSY-(SQRT(@var))));
-- 	end//

-- GO
