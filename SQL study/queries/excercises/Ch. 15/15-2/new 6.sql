SELECT concat('%',col.column_name,'%')
FROM
 (SELECT column_name FROM information_schema.statistics
  WHERE table_name = 'customer' AND table_schema = 'sakila') col;
  
SELECT concat('ALTER TABLE sakila.customer ','ADD INDEX ',index_name,'_excercise ','(',
	 CASE
		WHEN index_name LIKE concat('%',column_name,'%')
			THEN column_name,')'
		WHEN index_name NOT LIKE concat('%',column_name,'%') AND seq_in_index = 1
			THEN column_name,', ',
				(SELECT column_name WHERE seq_in_index = 2 AND column_name != 'PRIMARY')
		ELSE column_name,')'
	 END
		
		
		
		THEN (SELECT column_name WHERE seq_in_index = 1)
			
		(SELECT index_name, column_name FROM information_schema.statistics
				WHERE table_name = 'customer' AND table_schema = 'sakila'
	 AND index_name NOT LIKE 
	 concat('%',column_name,'%');
		THEN column_name1,', ',column_name2,')'
		ELSE <####>) create_indexes_statement
FROM information_schema.statistics
WHERE table_name = 'customer' AND table_schema = 'sakila';