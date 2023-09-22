SELECT index_name, column_name FROM information_schema.statistics
	WHERE table_name = 'customer' AND table_schema = 'sakila'
	 AND index_name NOT LIKE 
	 concat('%',column_name,'%');