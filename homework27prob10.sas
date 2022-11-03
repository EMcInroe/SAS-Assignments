/**********************************
Homework 27 Problem 5.10
In this program we do the same as problem 
5.8 except the LOG function is used in the 
data step to create a new variable that is 
the natural natural log of the DOSE. LDOSE 
is used instead of DOSE to create 
regression lines. 
**********************************/
OPTIONS NODATE NONUMBER;

DATA doselog_response;
	set dose_response;
	LDOSE = Log(DOSE);
RUn;

SYMBOL VALUE = DOT COLOR = BLACK;
PROC REG data = doselog_response;
	title 'LOGDOSE vs SBP and DBP';
	model SBP DBP = LDOSE;
	PLOT SBP * LDOSE 
			residual. * LDOSE 
		DBP * LDOSE
			residual. *LDOSE;
RUN;
QUIT;
