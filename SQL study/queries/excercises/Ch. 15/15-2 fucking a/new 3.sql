
	(SELECT column_name
	 FROM
		(SELECT index_name, column_name, seq_in_index
		 FROM information_schema.statistics
		 WHERE table_name = 'customer') list
	 WHERE seq_in_index = 2
	) last
	
	
	
	
	
SELECT concat('ALTER TABLE sakila.customer ','ADD INDEX ',index_name,'_excercise ','(',
	CASE
		WHEN index_name LIKE concat('%',column_name,'%')
			OR index_name LIKE concat('%','PRIMARY','%')
				THEN (column_name)
		WHEN index_name NOT LIKE concat('%',column_name,'%')
			AND seq_in_index = 1
				THEN (concat(column_name,', ',
					(SELECT list.column_name
					FROM (SELECT index_name, column_name, seq_in_index
								FROM information_schema.statistics
								WHERE table_name = 'customer') list
					WHERE seq_in_index = 2))
			)
	END,
	')')
FROM information_schema.statistics
WHERE table_name = 'customer';



SELECT
	concat('ALTER TABLE sakila.customer ','ADD INDEX ',index_name,'_excercise ','(',
		CASE
			WHEN index_name LIKE concat('%',column_name,'%')
				OR index_name LIKE concat('%','PRIMARY','%')
					THEN (column_name)
			ELSE (concat(column_name,', ',
				(SELECT list.column_name
				FROM (SELECT index_name, column_name, seq_in_index
							FROM information_schema.statistics
							WHERE table_name = 'customer') list
				WHERE seq_in_index = 2)
				)
		)
		END,
	');'
	) create_indexes_statement
FROM information_schema.statistics
WHERE table_name = 'customer'
	AND seq_in_index < 2;


SELECT concat('ALTER TABLE sakila.customer ','ADD INDEX ',index_name,'_excercise ','(',
	CASE
		WHEN index_name LIKE concat('%',column_name,'%')
			OR index_name LIKE concat('%','PRIMARY','%')
				THEN (column_name)
		ELSE (concat(column_name,', ',
			(SELECT list.column_name
			 FROM (SELECT index_name, column_name, seq_in_index
						 FROM information_schema.statistics
						 WHERE table_name = 'customer') list
			 WHERE seq_in_index = 2)
					)
				)
	END,
	')') create_indexes_statement
FROM list
WHERE seq_in_index < 2;
