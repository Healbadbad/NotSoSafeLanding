use NotSoSafeLanding
 

Delimiter //
DROP TRIGGER IF EXISTS BuildingImpactIns;
Create trigger BuildingImpactIns
AFTER INSERT ON  Building FOR EACH ROW
  BEGIN
  Set @randPolitical = FLOOR(RAND() * (9 - 3 + 1)) + 3;
  Set @randInternational= FLOOR(RAND() * (8 - 1 + 1)) + 1;
  Set @randMonetary = FLOOR(RAND() * (9 - 3 + 1)) + 3;
  Set @randEmotional = FLOOR(RAND() * (10 - 1 + 1)) + 1;
  Set @ID = New.IID;
  Set @count1 = (Select Count(*) from Impact where Impact.IID = @ID);
  if (@count1 = 0) THEN
        Insert into Impact (Political, International, Monetary, Emotional, IID)
        values (@randPolitical, @randInternational, @randMonetary, @randEmotional, @ID);
  END IF;
  END;//

-- FLOOR(RAND() * (<max> - <min> + 1)) + <min>