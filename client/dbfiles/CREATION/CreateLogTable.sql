use NotSoSafeLanding

DROP TABLE IF EXISTS RequestHistory;
Create table RequestHistory
(
ID int AUTO_INCREMENT NOT NULL,
Location varchar(50),
NOB int,
crashstamp DATETIME NOT NULL,
PRIMARY KEY (ID)
);
