/*******************************************
Homework 31 Problem 9.8
In this program we analyze data from a previously
created data set. PROC FREQ and PROC LOGISTIC is 
used to analyze the relationship between 
smoking and lung cancer. The CHISQ and CMH 
options are used in the FREQ procedure in order 
to get the Chi-square and odds ratio values. 
*******************************************/
OPTIONS NODATE NONUMBER;

PROC FREQ data = smoking;
	title 'Two-way Table';
	tables outcome*smoking / CHISQ CMH;
RUN;

PROC LOGISTIC data = smoking;
	title 'Smoking Logistic Regression';
	Model outcome = smoking;
RUN;
