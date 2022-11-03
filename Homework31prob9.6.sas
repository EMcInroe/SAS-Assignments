/************************************************
Homework 31 problem 9.6
In this program a correlation matric is created
using a previously created data set. 
************************************************/
OPTIONS NODATE NONUMBER;

PROC CORR DATA = EXERCISE NOSIMPLE;
	TITLE 'EXERCISE CORRELATION MATRIX';
	VAR PRESS CURL PUSHUPS SITUPS;
RUN;
/**********************************************
New data set created with the EXERCISE data set
so create a dummy variable for GENDER so that a 
stepwise multiple regression to predict PRESS 
can be performed. 
**********************************************/
Data exercisedum;
	set exercise;
	If Gender IN ('Female' 'Male') then Do;
		Female = (Gender EQ 'Female');
	End;
RUN;
/***********************************************
REG procedure to perform the stepwise multiple
regression to predict PRESS using the 4 
independent variables. 
***********************************************/
PROC REG data = exercisedum;
	title 'Problem 9.6 Stepwise Regression';
	MODEL PRESS = FEMALE CURL PUSHUPS SITUPS / 
				SELECTION = STEPWISE;
RUN;
QUIT;

