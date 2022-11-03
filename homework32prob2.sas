/*********************************************************************
Homework 32 Problem 2
In this program a new table is created in the SQL procedure. Data is 
read from two previously created data sets. The needed columns are 
specified in the SELECT statement. A new column is created using a 
numeric function AVG(), which calculates the average MCV for each country. 
The WHERE clause selects only those row that appear in both data sets. 
Another query uses the table created to display only the rows that meet 
the conditions of the HAVING clause.
*********************************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME sasfiles 'C:\users\eudoc\documents\statistics\stats482\sasfiles';

title 'Problem 2 Table';
PROC SQL;
	Create Table Avg_MCV as
		Select country,
				AVG(MCV) as avg_MCV
		From sasfiles.back as S1, sasfiles.backhem as S2
		where S1.subj = S2.subj
		Group By country
		Having avg_MCV between 80 and 96;
		Select *
		From Avg_MCV;
		  
QUIT;
