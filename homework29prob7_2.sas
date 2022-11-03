/**********************************************
Homework 29 Problem 7.2
In this program a data set is created using nested
DO loops to create the variables. The data set is 
then analyzed using the ANOVA procedure. 
**********************************************/
OPTIONS NODATE NONUMBER;

Data cholesterol;
	length Treat $7.;
	Do Treat = 'A','B','Placebo';
		Do Subject = 1 to 10;
			input Reading @;
			Output;
		End;
	End;
DATALINES;
220 190 180 185 210 170 178 200 177 189
160 168 178 200 172 155 159 167 185 199
240 220 246 244 198 238 277 255 190 188
;
RUN;

PROC PRINT data = cholesterol NOOBS;
	title 'Cholesterol Data Set';
Run;
/**********************************************
Treat is the independent variable and Reading is 
the dependent variable. The Student-Newman-Keuls
(SNK) test is also performed as a post-hoc 
comparison to analyze differences between the 
different treatments. 
**********************************************/
PROC ANOVA data = cholesterol;
	TITLE 'Analysis of Cholesterol Data';
	CLASS Treat;
	MODEL Reading = Treat;
	MEANS Treat / SNK;
RUN;
