/**********************************************************
Homework Problem 5.8
In this program the DOSE_RESPONSE data set is used in the 
REG procedure to create regression lines between SBP and 
DOSE as well as DBP and DOSE. The residuals versus DOSE is 
also produced. 
**********************************************************/
OPTIONS NODATE NONUMBER;

PROC REG data = DOSE_RESPONSE;
	title 'DOSE_RESPONSE REGRESSION and RESIDUAL Plots';
	model SBP DBP = DOSE; 
	PLOT SBP * DOSE 
		residual.*DOSE
		DBP * DOSE
		residual. *DOSE;
RUN;
QUIT;
