/*******************************************
Homework 31 Problem 9.2
In this program the data set 'tomato' is created.
Dummy variables are created in the data set
for light and water that will be used as the 
independent variables in the PROC REG.
*******************************************/
OPTIONS NODATE NONUMBER;

Data tomato;
	input yield light water;
	if light IN (1, 2, 3) then do;
		light1 = (light EQ 2);
		light2 = (light EQ 3);
	End;
	if water IN (1, 2) then do;
		water1 = (water EQ 1);
	End;
DATALINES;
12 1 1 
9 1 1 
8 1 1
13 1 2
15 1 2
14 1 2
16 2 1
14 2 1
12 2 1
20 2 2
16 2 2
16 2 2
18 3 1
25 3 1
20 3 1
25 3 2
27 3 2
29 3 2
;
RUN;

PROC PRINT data = tomato NOOBS;
	title 'Tomato Data Set';
RUN;

/***********************************************
REG procedure used to perform the multiple regression.
Yield is the dependent variable while the dummy 
variables that were created are the independent
variables. The P and R options are used in the 
MODEL statement so that SAS will compute and print
the predicted values and residuals. 
***********************************************/
PROC REG data = tomato;
	title 'Tomato Multiple Regression';
	MODEL yield = light1 light2 water1 / P R;
RUN;
QUIT;
