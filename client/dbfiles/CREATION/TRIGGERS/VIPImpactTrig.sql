use NotSoSafeLanding
 

Delimiter //
DROP TRIGGER IF EXISTS VIPImpactIns;
Create trigger VIPImpactIns
AFTER INSERT ON  VIP FOR EACH ROW
  BEGIN 
  Set @randPolitical = FLOOR(RAND() * (8 - 2 + 1)) + 7;
  Set @randInternational = FLOOR(RAND() * (7 - 3 + 1)) + 3;
  Set @randMonetary = FLOOR(RAND() * (4 - 2 + 1)) + 2;
  Set @randEmotional = FLOOR(RAND() * (6 - 4 + 1)) + 4;
  Set @ID = New.VIPID;
  Set @count1 = (Select Count(*) from Impact where Impact.IID = @ID);
  if (@count1 = 0) THEN
        Insert into Impact (Political, International, Monetary, Emotional, IID) 
        values (@randPolitical, @randInternational, @randMonetary, @randEmotional, @ID);
  END IF;
  END;//
