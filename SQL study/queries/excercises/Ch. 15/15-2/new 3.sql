SELECT s1.count(*)
FROM information_schema.statistics AS s1
WHERE s1.table_name = 'customer' AND 
	(SELECT s2.count(*) 
	 FROM information_schema.statistics s2 
	 WHERE s2.table_name = 'customer' AND s2.index_name = s1.index_name) > 1;