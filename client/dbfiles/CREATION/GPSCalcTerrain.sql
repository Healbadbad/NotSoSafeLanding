use NotSoSafeLanding

drop procedure if exists TerrainGPSCalc;
delimiter //
CREATE PROCEDURE TerrainGPSCalc
	(
	IN TerrainGPSX float, TerrainGPSY float
	) 
	begin
		Select TID, TType, flatness, IID, GPSX, GPSY, (3959*acos(cos(radians(TerrainGPSX))*cos(radians(GPSX))*cos(radians(GPSY)-radians(TerrainGPSY))+
		sin(radians(TerrainGPSX)) * sin(radians(GPSX) ))) AS distance
		FROM Terrain
		HAVING distance < 50
		ORDER BY distance;
	end//