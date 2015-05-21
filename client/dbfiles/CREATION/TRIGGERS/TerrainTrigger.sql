use NotSoSafeLanding
 

Delimiter //
DROP TRIGGER IF EXISTS TerrainIns;
Create trigger TerrainIns
BEFORE INSERT ON  Terrain FOR EACH ROW
  BEGIN 
  Set @LZI = New.TID;
  Set @X = New.GPSX;
  Set @Y = New.GPSY;
  Set @Typ = New.TType;
  Set @ID = New.IID;
  Set @count1 = (Select Count(*) from LandingZone where LandingZone.IID = @ID);
  if (@count1 = 0) THEN
        Insert into LandingZone (LID, Name, ChanceOfSurvival, GPSX, GPSY, IID) 
        values (@LZI, @Typ, 5, @X, @Y, @ID);
  END IF;
  END;//
