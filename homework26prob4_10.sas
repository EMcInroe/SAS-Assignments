/*****************************************************************
Homework 26 Problem 4.10

In this program the MEANS procedure is used find the mean, median 
and standard deviation for the data in the clinicalwgt data set 
created in problem 4.4. A data set is created from the statistics
created in the MEANS procedure. Then 4 other data sets are created
from the subsets of the summary data set. The PROC MEANS statement
includes the options for the specified statistics (mean, median, and
standard deviation0. It also includes the Maxdec option to round to 
2 decimal places. It also includes the chartype option, which changes 
the _type_ variable values to a binary number as a character variable.
The AUTONAME option is used to let SAS create the variable names for
Summary data set. In the data step the if-then-else statements 
are used to create the data sets based on the value of the _Type_
variable. Then all data sets are printed.
*****************************************************************/
OPTIONS NODATE NONUMBER; 
proc means data = clinicalwgt mean median std maxdec=2 chartype;
	class gender group;
	var weight diffweight;
	output out = summary
		mean = 
		median = 
		std = /AUTONAME;

Run;

Data grand gender group gender_group;
	set summary;
	if _type_ = '00' then output grand;        
else if _type_ = '01' then output group;
else if _type_ = '10' then output gender;
else if _type_ = '11' then output gender_group;
Run;

Proc Print data = summary NOOBS;
	title 'Summary Data Set';
Run;

Proc Print data = grand NOOBS;
	title 'Grand Data Set';
RUN;

PROC Print data = group NOOBS;
	title 'Group data Set';
Run;

Proc Print data = gender NOOBS;
	title 'Gender Data Set';
Run;

Proc Print data = gender_group NOOBS;
	title 'Gender_Group Data Set';
Run;
