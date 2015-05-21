use NotSoSafeLanding
 

drop procedure if exists Bccsp;
CREATE PROCEDURE Bccsp
	(
	IN BBID int, BName char(50), BArea int, BCapacity int, BCity char(50), Bholder char(50), BValue int, BSIntegrity int, BGPSX float, BGPSY float, BIID int
	)

INSERT INTO Building(BID, Name, Area, Capacity, City, holder, Value, SIntegrity, GPSX, GPSY, IID)
VALUES (BBID, BName, BArea, BCapacity, BCity, Bholder, BValue, BSIntegrity, BGPSX, BGPSY, BIID);
