USE airtraffic ;
-- 1 Query all flights out of Chicago's ORD airport
		SELECT * FROM flight WHERE DepartureAirport_FK='ORD'; 
-- 2 Query all Thursday morning flights
		SELECT * FROM flight WHERE DayOfWeek='Thursday' and DepartureTime<'12:00';
-- 3 Insert a new flight with a new flight ID
		INSERT into flight(FlightID, DayofWeek, DepartureAirport_FK, DepartureTime, ArrivalAirport_FK, ArrivalTime, Plane_FK) VALUES ('LS1432', 'Thursday', 'JFK', '9:00', 'PDX','14:00',3);
-- 4 Delete the Friday morning flight out of PER
		SELECT * FROM flight WHERE DepartureAirport_FK='PER' and DepartureTime<'12:00';
		DELETE FROM flight WHERE DepartureAirport_FK='PER' and DepartureTime<'12:00'; 
-- 5 Alter each CREATE TABLE statement to add a Primary Key, selecting appropriate field
		ALTER TABLE plane ADD PRIMARY KEY (ID);
	
		ALTER TABLE city ADD PRIMARY KEY (Name, Nation);
	
		ALTER TABLE airport ADD PRIMARY KEY (Code);
	
		ALTER TABLE flight ADD PRIMARY KEY (FlightID);
	    
-- 6 Alter necessary CREATE TABLE statements to add a Foreign Key constraint for each field with the '_FK' suffix
	-- 	had to use following code due to index not being there in dbeaver
	CREATE INDEX Nation_FK USING BTREE ON airtraffic.airport (Nation_FK);
	CREATE INDEX City_FK USING BTREE ON airtraffic.airport (City_FK);
	CREATE INDEX Nation USING BTREE ON airtraffic.city (Nation);
-- -------------------------------------------------------------------
	ALTER TABLE airport 
		ADD CONSTRAINT City_FK FOREIGN KEY(City_FK) REFERENCES city(Name),
		ADD CONSTRAINT Nation_FK FOREIGN KEY(Nation_FK) REFERENCES city(Nation);
	
	ALTER  TABLE flight	
		ADD CONSTRAINT DepartureAirport_FK FOREIGN KEY(DepartureAirport_FK) REFERENCES airport(Code),
		ADD CONSTRAINT ArrivalAirport_FK FOREIGN KEY(ArrivalAirport_FK) REFERENCES airport(Code), 
		ADD CONSTRAINT Plane_FK FOREIGN KEY(Plane_FK) REFERENCES plane(ID);
	
