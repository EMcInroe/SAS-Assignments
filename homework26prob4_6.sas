/***********************************************************************
Homework 26 Problem 4.6

In this program data is used from previously created data sets to calculate
the number of days between the first and last visit as well as the total 
change in weight from the first to last visit. The data set is also 
transposed so that there is one observation per patient. 
***********************************************************************/
OPTIONS LS = 100 CENTER NODATE NONUMBER;

Data change;
	set clinicalsrt;
	by patient visit;                                   *creates first.patient and last.patient variable;
		if first.patient and last.patient then delete;  *delete patients with only one visit; 
		if first.patient then                           
			first_visit = date_visit;                   *creates new variable for date of first visit;
		if last.patient then last_visit = date_visit;   *creates new variable for date of last visit;
		if last.patient 
			then days = datdif(first_visit,last_visit,'act/act');  *calculates days between first and last visit;
		if first.patient then first_weight = weight;    *creates new variable for first weight;
		if last.patient then last_weight = weight;      *creates new variable for last weight;
		if last.patient then weightdif = last_weight-first_weight; *calculates total change in weight;
		retain first_visit first_weight; ;              *retains values so we can calculate new data;
		format first_visit last_visit date9.;           *formats dates for output;
array allvisits (4) v1-v4;                              *creates array with weight to transpose data set; 
		if first.patient then i=1;                      *finds first value for array;
		if first.patient then v3=.; v4=.;               *sets other values to missing so they are not retained;
		allvisits(i) = weight;
		i + 1;
		if last.patient then output;
		retain v1-v4;
		drop visit date_visit weight i;                 *drops unnecessary variables;

	RUn;

	PROC PRINT data = change;
	title 'Change Data Set';
	id patient;
RUN;



 
	
