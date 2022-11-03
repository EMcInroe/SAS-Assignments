/*******************************************
Homework 29 Problem 7.6

In this program nested Do loops are used to input
data to create a data set. The data is then 
analyzed using the GLM procedure for two-way
analysis of variance to see the effects of 
a drug and genetic differences on depression.
*******************************************/
OPTIONS NODATE NONUMBER;

Data depression;
	Length Treat $7.;
	Do group = 'Deficiency','Normal';
		Do Treat = 'Drug','Placebo';
			Do Subj = 1 to 4;
				input Result @;
				Output;
			End;
		End;
	End;
DATALINES;
9 11 10 10 9 6 6 7 5 4 7 7 12 11 10 11
;
RUN;

PROC Print data = depression NOOBS;
	title 'Depression Data Set';
Run;

/********************************************
Two-way analysis of variance to test for drug 
and genetic differences.  Group and Treat are 
the independent variables and Result is the 
dependent variable. | used to indicate a 
factorial design. 
********************************************/
PROC GLM data = depression;
	Title 'Depression Study';
	CLASS Group Treat;
	MODEL Result = Group | Treat;
	Means Group | Treat;
RUN;
*creates cell means and new data set;
Proc Means data = depression NWAY NOPRINT;
	CLASS Group Treat;
	VAR Result;
	Output out=MEANS MEAN = M_Score;
RUN;

PROC PRINT data = Means NOOBS;
	Title 'Means Output';
Run;

*creates the interaction plot;
SYMBOL1 Value=DOT color=BLACK I=JOIN;
SYMBOL2 Value=SQUARE color=BLUE I=JOIN;
PROC GPLOT data = MEANS;
	Title 'Interaction Plot';
	PLOT M_score*Treat = Group;
RUN;
QUIT;

*analyzes effect of drug separately;
PROC GLM data = depression;
	Title 'Analysis of Main Effects';
	CLASS Group treat;
	MODEL Result = Group | Treat /SS3;
	Contrast 'Genetic Deficiency Only' Treat 1 -1
									Group*Treat 1 -1 0 0;
	CONTRAST 'Normals Only' Treat 1 -1
							Group*Treat 0 0 1 -1;
Run;
QUIT;
