use NotSoSafeLanding

drop procedure if exists AirportGPSCalc;
delimiter //
CREATE PROCEDURE AirportGPSCalc
	(
	IN AirGPSX float, AirGPSY float
	) 
	begin
		Select AID, Name, ZIP, Terminals, IID, GPSX, GPSY, (3959*acos(cos(radians(AirGPSX))*cos(radians(GPSX))*cos(radians(GPSY)-radians(AirGPSY))+
		sin(radians(AirGPSX)) * sin(radians(GPSX) ))) AS distance
		FROM Airport
		HAVING distance < 50
		ORDER BY distance;
	end//