SELECT s.count(*)
FROM statistics s
WHERE s.table_name = 'customer' AND 1 <
	(SELECT s2.count(*) 
	 FROM statistics s2 
	 WHERE s2.table_name = 'customer' AND s2.index_name = s1.index_name);