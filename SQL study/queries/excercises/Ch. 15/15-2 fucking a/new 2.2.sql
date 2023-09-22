CREATE TABLE flights
 (year VARCHAR(4),
	month VARCHAR(2),
	day VARCHAR(2),
	day_of_week VARCHAR(1),
	airline VARCHAR(2),
	flight_number SMALLINT UNSIGNED,
	tail_number VARCHAR(10),
	origin_airport VARCHAR(3),
	destination_airport VARCHAR(3),
	scheduled_departure SMALLINT UNSIGNED,
	departure_time VARCHAR(4),
	departure_delay VARCHAR(4),
	taxi_out varchar(5),
	wheels_off VARCHAR(5),
	scheduled_time VARCHAR(5),
	elapsed_time VARCHAR(5),
	air_time VARCHAR(5),
	distance VARCHAR(5),
	wheels_on VARCHAR(5),
	taxi_in VARCHAR(5),
	scheduled_arrival VARCHAR(5),
	arrival_time VARCHAR(5),
	arrival_delay VARCHAR(5),
	diverted VARCHAR(5),
	cancelled VARCHAR(5),
	cancellation_reason VARCHAR(1),
	air_system_delay VARCHAR(4) ,
	security_delay VARCHAR(4),
	airline_delay VARCHAR(4),
	late_aircraft_delay VARCHAR(4),
	weather_delay VARCHAR(4)
 )
 PARTITION BY LIST COLUMNS (airline)
 (PARTITION A VALUES IN ('A%'),
	PARTITION B VALUES IN ('B%'),
	PARTITION D VALUES IN ('D%'),
	PARTITION E VALUES IN ('E%'),
	PARTITION F VALUES IN ('F%'),
	PARTITION H VALUES IN ('H%'),
	PARTITION M VALUES IN ('M%'),
	PARTITION N VALUES IN ('N%'),
	PARTITION O VALUES IN ('O%'),
	PARTITION U VALUES IN ('U%'),
	PARTITION V VALUES IN ('V%'),
	PARTITION W VALUES IN ('W%')
 );