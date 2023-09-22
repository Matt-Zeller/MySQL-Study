SELECT concat('ALTER TABLE sakila.customer ','ADD INDEX ',index_name,'_excercise ','(',
	 CASE
		WHEN index_name LIKE concat('%',column_name,'%')
			THEN (column_name,')')
		WHEN seq_in_index = 1 AND index_name NOT LIKE concat('%',column_name,'%')
			THEN (column_name,', ',
				(SELECT column_name WHERE seq_in_index = 2 AND column_name != 'PRIMARY'))
		ELSE (column_name,')'
	 END)
FROM information_schema.statistics
WHERE table_name = 'customer' AND table_schema = 'sakila';





SELECT concat('ALTER TABLE sakila.customer ','ADD INDEX ',index_name,'_excercise ','(',
	 CASE
		WHEN index_name LIKE concat('%',column_name,'%')
			THEN (column_name,')')
		ELSE test
	 END)
FROM information_schema.statistics
WHERE table_name = 'customer' AND table_schema = 'sakila';




SELECT concat('ALTER TABLE sakila.customer ','ADD INDEX ',index_name,'_excercise ','(',
 CASE
  WHEN index_name LIKE concat('%',column_name,'%')
   THEN (column_name)
  ELSE 'test_string'
 END
 )
FROM information_schema.statistics
WHERE table_name = 'customer';




SELECT concat('ALTER TABLE sakila.customer ','ADD INDEX ',index_name,'_excercise ','(',
	CASE
		WHEN index_name LIKE concat('%',column_name,'%')
			THEN (column_name)
		ELSE 'test_string'
	END,
	')')
FROM information_schema.statistics
WHERE table_name = 'customer';