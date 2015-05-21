use NotSoSafeLanding
 

Delimiter //
DROP TRIGGER IF EXISTS AirportImpactIns;
Create trigger AirportImpactIns
AFTER INSERT ON  Airport FOR EACH ROW
  BEGIN 
  Set @randPolitical = FLOOR(RAND() * (3 - 1 + 1)) + 1;
  Set @randMonetary = FLOOR(RAND() * (3 - 2 + 1)) + 2;
  Set @randEmotional = FLOOR(RAND() * (3 - 2 + 1)) + 2;
  Set @ID = New.IID;
  Set @count1 = (Select Count(*) from Impact where Impact.IID = @ID);
  if (@count1 = 0) THEN
        Insert into Impact (Political, International, Monetary, Emotional, IID)
        values (@randPolitical, 0, @randMonetary, @randEmotional, @ID);
  END IF;
  END;//
