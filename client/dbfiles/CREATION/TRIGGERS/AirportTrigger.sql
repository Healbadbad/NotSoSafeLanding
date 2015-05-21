use NotSoSafeLanding
 

Delimiter //
DROP TRIGGER IF EXISTS AirportIns;
Create trigger AirportIns
BEFORE INSERT ON  Airport FOR EACH ROW
  BEGIN 
  Set @othID = New.AID;
  Set @X = New.GPSX;
  Set @Y = New.GPSY;
  Set @Nam = New.Name;
  Set @ID = New.IID;
  Set @count1 = (Select Count(*) from LandingZone where LandingZone.IID = @ID);
  if (@count1 = 0) THEN
        Insert into LandingZone (LID, Name, ChanceOfSurvival, GPSX, GPSY, IID) 
        values (@othID, @Nam, 0, @X, @Y, @ID);
  END IF;
  END;//
