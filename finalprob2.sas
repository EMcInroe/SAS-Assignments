/*********************************************************************
Final Problem 2
In this program data is read from a raw data file. The data is then 
transposed into a fat data set with one observation for each bird. A 
paired t-test is then performed to see if there is a significant 
difference between the mean yellowness of typical feathers and odd 
feathers.
*********************************************************************/
OPTIONS NODATE NONUMBER;

Data bird;
	infile 'C:\users\eudoc\documents\statistics\stats482\birds.dat';
	input bird $ feather $ yellowness;
RUN;

*data sorted to create first.bird and last.bird variables;
PROC SORT data = bird  out = birdsrt;
	by bird;
RUN;

Data birdfat;
	set birdsrt;
	by bird;
		array yellow (2) Typical Odd;
			if first.bird then i = 1;
			yellow(i) = yellowness;
		if last.bird then output;
		i+1;
		retain Typical;
	drop i feather yellowness;
Run;

PROC PRINT data = birdfat;
Run;

PROC TTEST data = birdfat;
	PAIRED Typical*Odd;
RUN;
