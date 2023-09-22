CREATE TABLE Sales_Fact2
	(row_no TINYINT UNSIGNED,
	 year_no YEAR,
	 month_no TINYINT UNSIGNED,
	 tot_sales SMALLINT UNSIGNED,
	 CONSTRAINT pk_SalesFact PRIMARY KEY (row_no)
	);