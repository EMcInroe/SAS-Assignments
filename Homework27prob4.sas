/*************************************
Homework 27 problem 5.4
In this program we are using the CORR
procedure to generate a correlation 
matrix of all test scores plus the 
overall score. NOSIMPLE option is used
to omit simple statistics. 
*************************************/
OPTIONS NODATE NONUMBER;

PROC CORR data = scores NOSIMPLE;
	title 'Scores Correlation Matix';
RUN;
