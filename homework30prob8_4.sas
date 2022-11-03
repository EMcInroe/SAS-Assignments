/******************************************************
Homework 30 Problem 8.4
In this program we perform a two-way ANOVA test. The GLM
procedure is used to conduct the test. Subjects are nested
within gender. Model statement defines all sources of 
variation about the grand mean. The test statements 
specify which error term to be used to test each hypothesis
in the experiment design. H= is the hypothesis, while 
E= is the error term. 
******************************************************/
OPTIONS NODATE NONUMBER;

PROC GLM data = statin;
	title 'Two-way ANOVA';
	CLASS SUBJ GENDER DRUG;
	MODEL HDL = GENDER SUBJ(GENDER) DRUG
				GENDER*DRUG DRUG*SUBJ(GENDER) / SS3;
	LSMEANS GENDER | DRUG;
	TEST H=GENDER            E=SUBJ(GENDER);
	TEST H=DRUG GENDER*DRUG  E=DRUG*SUBJ(GENDER);
RUN;
QUIT;

/*****************************************************
In order to learn more about the differences in the 
genders from the interaction term we create an 
interaction plot using the GPLOT procedure. The MEANS
procedure also needs to completed to find the means 
used in the interaction plot. The y-axis will be the
HDL measurements and the x-axis will be the 3 different
drugs. 
*****************************************************/
PROC MEANS DATA = statin NWAY;
	CLASS GENDER DRUG;
	VAR HDL;
	OUTPUT OUT=INTER MEAN=;
RUN;

SYMBOL1 VALUE = CIRCLE COLOR = BLACK I=JOIN;
SYMBOL2 VALUE = SQUARE COLOR = BLUE I=JOIN;
PROC GPLOT DATA = inter;
	title 'Interaction Plot';
	PLOT HDL*DRUG = GENDER;  
RUN;
QUIT;

