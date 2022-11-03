/******************************************************************
Homework 32 Problem 1
In this program the SQL procedure is used to complete a query and 
create an output like the one in the instructions. The Where clause 
is used to select on the rows for the 1st visit. Data is grouped by 
group and then the average weight it taken for each group. That 
value is then used in another calculation for weight difference. 
Then the data are sorted by their data of visit in the ORDER BY 
clause. 
******************************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME sasfiles 'C:\users\eudoc\documents\statistics\stats482\sasfiles';

PROC SQL;
	title'Within Treatment Group Differences on the First Visit';
	 select patient,
		gender,
		v_date label='First_visit' format=date9.,  
		avg(weight) as Group_average,
		weight - calculated Group_average as Within_Group_Dif 
		from sasfiles.clinical
		where visit = 1
		group by group
		order by v_date;
Quit;
