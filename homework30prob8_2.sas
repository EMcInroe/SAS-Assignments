/**************************************
Homework 30 Problem 8.2
In this program we use data from a previously
created data set analyze the effects of 
different drugs on cholesterol. In the first 
part the ANOVA procedure is used to perform
a one-way ANOVA with repeated measures for 
the same subjects. The | symbol is not used
in the model statement because subj and drug 
are each main effects. 
**************************************/
OPTIONS NODATE NONUMBER;

PROC ANOVA data = statin;
	Title 'One-way Drug ANOVA';
	Class SUBJ DRUG;           *independent variables;
	MODEL HDL = SUBJ DRUG;     
	MEANS DRUG / SNK;           
RUN;
QUIT;

/************************************************
Creates a new data set that transposes the statin 
to have only one observation for each subject
*************************************************/
Data fatstatin;
	set statin (DROP = LDL TOTAL GENDER DIET);
	by subj;
	array cholest (3) HDL1-HDL3;
		if first.subj then i = 1;
		cholest(i) = HDL;
		if last.subj then output;
		i+1;
		retain HDL1-HDL3;
		drop i DRUG HDL;
RUN;

PROC PRINT DATA = fatstatin NOOBS;
	title 'Fatstatin Data Set';
RUN;

/****************************************************
One-way ANOVA using REPEATED statements and CONTRAST
No independent variables are specified. NOUNI option 
tells SAS to not conduct a separate analysis for each
of the 3 HDL variables. The repeated factor is called
'DRUG'. 2 REPEATED statements are used since there are
3 different drugs that need to be compared. NOM option
asks no multivariate statistics to be printed. 
*****************************************************/
PROC ANOVA DATA = fatstatin;
	title 'One-way ANOVA with Repeated Statement';
	MODEL HDL1-HDL3 = /NOUNI;                  
	REPEATED DRUG 3 CONTRAST (1)/ NOM SUMMARY;
	REPEATED DRUG 3 CONTRAST (2)/ NOM SUMMARY;
RUN;
QUIT;
		
