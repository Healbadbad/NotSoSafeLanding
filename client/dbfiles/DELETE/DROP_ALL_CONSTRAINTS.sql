use NotSoSafeLanding

Alter table City drop foreign key Country_FK;

Alter table Plane drop foreign key Model_FK;

Alter table Building drop foreign key BID_FK;

Alter table Terrain drop foreign key TID_FK;

Alter table Airport drop foreign key AID_FK;

Alter table VIP drop foreign key Importance_FK;

Alter table Landing drop foreign key PlaneNumber_FK;

Alter table Plane drop foreign key DepartingAirport_FK;

Alter table Landing drop foreign key LZID_FK;

Alter table Landing drop foreign key PlaneNumber_FKL;

Alter table Landing drop foreign key IID_FK;
