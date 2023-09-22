SELECT year_no, month_no, tot_sales,
	lag(tot_sales, 1)
		over (order by month_no) prev_month_tot
FROM Sales_Fact2
WHERE year_no = 2020;