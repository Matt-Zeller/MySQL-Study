SELECT concat('ALTER TABLE sakila.customer ','ADD INDEX ',index_name,'_excercise ','(',
	CASE
		WHEN 
			(SELECT count(*) FROM information_schema.statistics
			  WHERE table_name = 'customer' AND table_schema = 'sakila'
				AND index_name NOT LIKE concat('%',column_name,'%')
		THEN column_name1,', ',column_name2,')'
		ELSE <####>) create_indexes_statement
FROM information_schema.statistics
WHERE table_name = 'customer' AND table_schema = 'sakila';




(SELECT column_name FROM information_schema.statistics
 WHERE table_name = 'customer' AND table_schema = 'sakila') col