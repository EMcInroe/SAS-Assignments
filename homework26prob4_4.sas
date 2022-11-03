/***************************************************
Homework 26 Problem 4.4

In this program data from a previously created data 
set is used to find the change in weight from one 
visit to the next. SORT procedure is used so that 
the By statement can be used in the data step. The
BY statement then creates the first.patient and 
last.patient variables needed to calculate the 
difference in weight. 
***************************************************/
OPTIONS NODATE NONUMBER;

PROC SORT data = clinical out = clinicalsrt;
	by patient visit;
Run;

Data clinicalwgt;
	set clinicalsrt; 
	by patient visit;                            
	diffweight = weight - LAG(weight);    *LAG Function takes previous value;
	if first.patient then diffweight = .; *prevents overlap of patient data;
Run;

PROC Print data = clinicalwgt NOOBS;
	title 'Weight Change By Visit';
Run;
