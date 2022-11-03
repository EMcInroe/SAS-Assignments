/***********************************
Homework 27 problem 5.6 part b
In this program the GPLOT procedure is used
to create the scatterplot of math vs science,
the regression line and 95% CI on the mean of
y (science). The symbol statement sets the 
symbol as dots and the color as black. The 
I= option tells SAS to include the regression
line and the 95% CI in the graph. The PLOT
statement tells SAS to plot math vs. science.
***********************************/
SYMBOL VALUE = DOT color = black I=RLCLM95;   

PROC GPLOT DATA = scores;
	title 'Regression Line and 95% CI';
	PLOT science * math;
RUN;
QUIT;
