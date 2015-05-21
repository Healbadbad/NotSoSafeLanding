use NotSoSafeLanding
 

Delimiter //
DROP TRIGGER IF EXISTS TerrainImpactIns;
Create trigger TerrainImpactIns
AFTER INSERT ON  Terrain FOR EACH ROW
  BEGIN
  Set @randPolitical = FLOOR(RAND() * (6 - 2 + 1)) + 2;
  Set @randInternational= FLOOR(RAND() * (10 - 5 + 1)) + 5;
  Set @randMonetary = FLOOR(RAND() * (5 - 2 + 1)) + 2;
  Set @randEmotional = FLOOR(RAND() * (8 - 3 + 1)) + 3;
  Set @ID = New.IID;
  Set @count1 = (Select Count(*) from Impact where Impact.IID = @ID);
  if (@count1 = 0) THEN
        Insert into Impact (Political, International, Monetary, Emotional, IID) 
        values (@randPolitical, @randInternational, @randMonetary, @randEmotional, @ID);
  END IF;
  END;//
