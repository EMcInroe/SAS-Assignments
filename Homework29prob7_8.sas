/**************************************************
Homework 29 Problem 7.8
In this program a previously created data set is used
to conduct an analysis of covariance. 
**************************************************/
OPTIONS NODATE NONUMBER;

*Correlation between IQ and Score is computed;
PROC CORR data = co_vary NOSIMPLE;
	title 'Correlation Between IQ and Score';
	VAR IQ SCORE;
RUN;

*T-test to compare IQ and Score;
PROC TTEST data = co_vary;
	title 'T-test Analysis';
	CLASS GROUP;
	VAR IQ SCORE;
RUN;

*tests the homogeneity of the slope across groups;
PROC GLM data = co_vary;
	TITLE 'Homogeneity Test';
	CLASS GROUP;
	MODEL SCORE = IQ GROUP IQ*GROUP / SS3;
RUN;

/*********************************************
The two groups are adjusted for IQ and the score
is tested for difference among the groups. 
*********************************************/
PROC GLM DATA = co_vary;
	TITLE 'Analysis of Covariance';
	CLASS GROUP;
	MODEL SCORE = IQ GROUP / SS3;
	LSMEANS GROUP;
RUN;
QUIT;
