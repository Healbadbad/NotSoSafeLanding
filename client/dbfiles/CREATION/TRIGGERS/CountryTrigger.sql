use NotSoSafeLanding
 

Delimiter //
DROP TRIGGER IF EXISTS Countryins;
Create trigger Countryins
BEFORE INSERT ON  City FOR EACH ROW
  BEGIN 
  Set @coun = New.Country;
  Set @Coun1 = (Select Count(*) from Country where Country.Name = @coun);
  if (@coun1 = 0) THEN
        Insert into Country (Name, CValue, GDP, DangerLvl, Area, CCratio) 
        values (@coun, 10000, 100, 10, 5000, 5);
  END IF;
  END;//
  

