use NotSoSafeLanding

-- drop procedure if exists VIPCalcArea;
delimiter //
CREATE PROCEDURE VIPCalcArea
	(
	IN VIPGPSX float, VIPGPSY float
	) 
	begin
		Select Name, PositionX, PositionY, Age, Importance, VIPID, (3959*acos(cos(radians(VIPGPSX))*cos(radians(PositionX))*cos(radians(PositionY)-radians(VIPGPSY))+
		sin(radians(VIPGPSX)) * sin(radians(PositionX) ))) AS distance
		FROM VIP
		HAVING distance < 50
		ORDER BY distance;
	end//


-- Name char(50) NOT NULL,
-- PositionX float,
-- PositionY float,
-- Age int,
-- Importance varchar(50) NOT NULL,
-- VIPID int AUTO_INCREMENT NOT NULL,
-- PRIMARY KEY (VIPID)