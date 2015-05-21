{"filter":false,"title":"BuildingCityCountrySP.sql","tooltip":"/client/dbfiles/CREATION/BuildingCityCountrySP.sql","undoManager":{"stack":[[{"start":{"row":4,"column":3},"end":{"row":18,"column":8},"action":"remove","lines":["P TRIGGER IF EXISTS TerrainIns;","Create trigger TerrainIns","BEFORE INSERT ON  Terrain FOR EACH ROW","  BEGIN ","  Set @LZI = New.TID;","  Set @X = New.GPSX;","  Set @Y = New.GPSY;","  Set @Typ = New.TType;","  Set @ID = New.IID;","  Set @count1 = (Select Count(*) from LandingZone where LandingZone.IID = @ID);","  if (@count1 = 0) THEN","        Insert into LandingZone (LID, Name, ChanceOfSurvival, GPSX, GPSY, IID) ","        values (@LZI, @Typ, 5, @X, @Y, @ID);","  END IF;","  END;//"],"id":2}],[{"start":{"row":4,"column":2},"end":{"row":4,"column":3},"action":"remove","lines":["O"],"id":3}],[{"start":{"row":4,"column":1},"end":{"row":4,"column":2},"action":"remove","lines":["R"],"id":4}],[{"start":{"row":4,"column":0},"end":{"row":4,"column":1},"action":"remove","lines":["D"],"id":5}],[{"start":{"row":3,"column":12},"end":{"row":4,"column":0},"action":"remove","lines":["",""],"id":6}],[{"start":{"row":3,"column":11},"end":{"row":3,"column":12},"action":"remove","lines":["/"],"id":7}],[{"start":{"row":3,"column":10},"end":{"row":3,"column":11},"action":"remove","lines":["/"],"id":8}],[{"start":{"row":3,"column":9},"end":{"row":3,"column":10},"action":"remove","lines":[" "],"id":9}],[{"start":{"row":3,"column":8},"end":{"row":3,"column":9},"action":"remove","lines":["r"],"id":10}],[{"start":{"row":3,"column":7},"end":{"row":3,"column":8},"action":"remove","lines":["e"],"id":11}],[{"start":{"row":3,"column":6},"end":{"row":3,"column":7},"action":"remove","lines":["t"],"id":12}],[{"start":{"row":3,"column":5},"end":{"row":3,"column":6},"action":"remove","lines":["i"],"id":13}],[{"start":{"row":3,"column":4},"end":{"row":3,"column":5},"action":"remove","lines":["m"],"id":14}],[{"start":{"row":3,"column":3},"end":{"row":3,"column":4},"action":"remove","lines":["i"],"id":15}],[{"start":{"row":3,"column":2},"end":{"row":3,"column":3},"action":"remove","lines":["l"],"id":16}],[{"start":{"row":3,"column":1},"end":{"row":3,"column":2},"action":"remove","lines":["e"],"id":17}],[{"start":{"row":3,"column":0},"end":{"row":3,"column":1},"action":"remove","lines":["D"],"id":18}],[{"start":{"row":3,"column":0},"end":{"row":10,"column":96},"action":"insert","lines":["drop procedure if exists BuildingInsert;","CREATE PROCEDURE BuildingInsert","\t(","\tIN BBID int, BName char(50), BArea int, BCapacity int, BCity char(50), Bholder char(50), BValue int, BSIntegrity int, BGPSX float, BGPSY float, BIID int","\t)","","INSERT INTO Building(BID, Name, Area, Capacity, City, holder, Value, SIntegrity, GPSX, GPSY, IID)","VALUES (BBID, BName, BArea, BCapacity, BCity, Bholder, BValue, BSIntegrity, BGPSX, BGPSY, BIID);"],"id":19}],[{"start":{"row":3,"column":25},"end":{"row":3,"column":39},"action":"remove","lines":["BuildingInsert"],"id":20},{"start":{"row":3,"column":25},"end":{"row":3,"column":26},"action":"insert","lines":["b"]}],[{"start":{"row":3,"column":26},"end":{"row":3,"column":27},"action":"insert","lines":["c"],"id":21}],[{"start":{"row":3,"column":27},"end":{"row":3,"column":28},"action":"insert","lines":["c"],"id":22}],[{"start":{"row":3,"column":28},"end":{"row":3,"column":29},"action":"insert","lines":["s"],"id":23}],[{"start":{"row":3,"column":29},"end":{"row":3,"column":30},"action":"insert","lines":["p"],"id":24}],[{"start":{"row":4,"column":17},"end":{"row":4,"column":31},"action":"remove","lines":["BuildingInsert"],"id":25},{"start":{"row":4,"column":17},"end":{"row":4,"column":18},"action":"insert","lines":["b"]}],[{"start":{"row":4,"column":18},"end":{"row":4,"column":19},"action":"insert","lines":["c"],"id":26}],[{"start":{"row":4,"column":19},"end":{"row":4,"column":20},"action":"insert","lines":["c"],"id":27}],[{"start":{"row":4,"column":20},"end":{"row":4,"column":21},"action":"insert","lines":["s"],"id":28}],[{"start":{"row":4,"column":21},"end":{"row":4,"column":22},"action":"insert","lines":["p"],"id":29}],[{"start":{"row":3,"column":25},"end":{"row":3,"column":26},"action":"remove","lines":["b"],"id":30}],[{"start":{"row":3,"column":25},"end":{"row":3,"column":26},"action":"insert","lines":["B"],"id":31}],[{"start":{"row":4,"column":17},"end":{"row":4,"column":18},"action":"remove","lines":["b"],"id":32}],[{"start":{"row":4,"column":17},"end":{"row":4,"column":18},"action":"insert","lines":["B"],"id":33}]],"mark":31,"position":31},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":3,"column":10},"end":{"row":3,"column":10},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1431714487661,"hash":"fbed8adbb6b0bf92e699a0cdbdfc885f5c902c4f"}