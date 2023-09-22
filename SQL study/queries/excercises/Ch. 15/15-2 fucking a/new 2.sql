SELECT concat('ALTER TABLE sakila.customer ','ADD INDEX ',index_name,'_excercise ','(',
	CASE
		WHEN index_name LIKE concat('%',column_name,'%')
			THEN (column_name)
		WHEN index_name NOT LIKE concat('%',column_name,'%')
			AND seq_in_index = 1
			THEN (concat(column_name,', ',
				(SELECT list.column_name
				 FROM (SELECT index_name, column_name, seq_in_index
							 FROM information_schema.statistics
							 WHERE table_name = 'customer') list
				 WHERE seq_in_index = 2;)
			)
		ELSE ('')
	END,
	')')
FROM information_schema.statistics
WHERE table_name = 'customer';



SELECT
	concat('ALTER TABLE sakila.customer ','ADD INDEX ',index_name,'_excercise ','(',
		CASE
			WHEN index_name LIKE concat('%',column_name,'%')
				THEN (column_name)
			WHEN index_name NOT LIKE concat('%',column_name,'%') AND index_name != 'PRIMARY'
				THEN 
					(concat(
					 CASE
						WHEN seq_in_index = 1
							THEN 
								(concat(column_name,', ',
								 CASE
									WHEN seq_in_index = 2
										THEN (column_name)
									ELSE ''
								 END)
								)							
						ELSE ''
					 END)
					)
			ELSE (column_name)
		END,')'
	)
FROM information_schema.statistics
WHERE table_name = 'customer'
ORDER BY ordinal_position;

SELECT column_name
FROM
	(SELECT index_name, column_name, seq_in_index
	 FROM information_schema.statistics
	 WHERE table_name = 'customer') list
WHERE seq_in_index = 2;
	
