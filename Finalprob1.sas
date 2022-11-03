/**********************************************************************
Final Problem 1
In this progam data is read from a raw data file to create a data set.
A two-way analysis of variance with unbalanced design is then completed
on the data using the GLM procedure. An interaction plot is also 
constructed using the GPLOT procedure. 
**********************************************************************/
OPTIONS NODATE NONUMBER;

Data ratmaze;
	infile 'C:\users\eudoc\documents\statistics\stats482\ratmaze.dat';
	input age_grp strain $ speed @@;
RUN;

*analysis of variance for unbalanced design;
PROC GLM data = ratmaze;
	title 'RATMAZE STUDY';
	Class age_grp strain;                       *predictor variables;
	Model speed = age_grp | strain / SS3;
	LSMeans age_grp | strain / PDIFF ADJUST = TUKEY;  *calculates adjusted means;
RUN;
QUIT;

PROC MEANS data = ratmaze NWAY NOPRINT;
	CLASS age_grp strain;
	var speed;
	output out=MEANS MEAN = avg_speed;
RUN;

SYMBOL1 Value = DOT Color = Blue I = JOIN;
SYMBOL2 Value = square COLOR = Black I = JOIN;
PROC GPLOT Data = MEANS;
	title 'RATMAZE Interaction Plot';
	PLOT avg_speed*age_grp = strain;
RUN;
QUIT;
	
