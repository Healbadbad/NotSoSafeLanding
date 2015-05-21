use NotSoSafeLanding

drop procedure if exists BuildingGPSCalc;
delimiter //
CREATE PROCEDURE BuildingGPSCalc
	(
	IN BuildGPSX float, BuildGPSY float
	) 
	begin
		Select BID, Name, Area, Capacity, City, holder, Value, SIntegrity, IID, GPSX, GPSY, (3959*acos(cos(radians(BuildGPSX))*cos(radians(GPSX))*cos(radians(GPSY)-radians(BuildGPSY))+
		sin(radians(BuildGPSX)) * sin(radians(GPSX) ))) AS distance
		FROM Building
		HAVING distance < 50
		ORDER BY distance;
	end//


-- drop procedure if exists BuildingGPSCalc;
-- delimiter //
-- CREATE PROCEDURE BuildingGPSCalc
-- 	(
-- 	IN BuildGPSX float, BuildGPSY float
-- 	) 
-- 	begin
-- 		set @var = LandZGPSX*LandZGPSX + LandZGPSY*LandZGPSY;
-- 		Select * 
-- 		from Building 
-- 		where ((GPSX < BuildGPSX+(SQRT(@var)) 
-- 		and GPSX > BuildGPSX-(SQRT(@var)))
-- 		and (GPSY < BuildGPSY+(SQRT(@var)) 
-- 		and GPSY > BuildGPSY-(SQRT(@var))));
-- 	end//