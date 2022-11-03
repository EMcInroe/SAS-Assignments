/**************************************************************************
Final Problem 4
In this program, survival data is used from the Donner party to predict 
survival based on age and gender. The LOGISTIC procedure is used to perform 
a stepwise regression. Descending is used to that the procedure predicts
survival and not death. The RISKLIMITS option is used so that the odds 
ratios are calculated. 
**************************************************************************/
OPTIONS NODATE NONUMBER;

*formats created to make output more readable and interpretable;
PROC FORMAT;
	value survivalfmt 0 = 'NO'
					1 = 'YES';
	value genderfmt 0 = 'MALE'
					1 = 'FEMALE';
RUN;

*creates data set;
Data donner;
	infile 'C:\users\eudoc\documents\statistics\stats482\donner.dat' FIRSTOBS=2;
	input Survival Age Gender;
	format Survival survivalfmt. Gender genderfmt.;
RUN;

PROC LOGISTIC data  = donner DESCENDING;
	title 'Predicting Survival Using Logistic Regression';
	MODEL Survival = Age Gender/
		SELECTION = STEPWISE
		RISKLIMITS;
	RUN;
QUIT;
