use NotSoSafeLanding
 

Delimiter //
DROP TRIGGER IF EXISTS BuildingIns;
Create trigger BuildingIns
BEFORE INSERT ON  Building FOR EACH ROW
  BEGIN 
  Set @LZID = New.BID;
  Set @X = New.GPSX;
  Set @Y = New.GPSY;
  Set @Nam = New.Name;
  Set @ID = New.IID;
  Set @count1 = (Select Count(*) from LandingZone where LandingZone.IID = @ID);
  if (@count1 = 0) THEN
        Insert into LandingZone (LID, Name, ChanceOfSurvival, GPSX, GPSY, IID) 
        values (@LZID, @Nam, 1, @X, @Y, @ID);
  END IF;
  END;//
