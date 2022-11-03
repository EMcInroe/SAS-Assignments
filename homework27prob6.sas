/***************************************************************
Homework 27 Problem 5.6
In this program the REG procedure is used to make a scatter plot 
with a regression line showing science vs math and showing 
residuals vs. math. The model statement names the response variable 
(science)and the explanatory variable (math). The Plot statement
tells which y-variable and x-variable to put in the scatterplot.
The special variable residual. is used. 
***************************************************************/
SYMBOL1 value = dot color = black;
PROC REG data = scores;
	Title 'Math and Science Regression and Residual Plots';
	model science = math;
	PLOT science * math
		residual. * math;
RUN; 
QUIT;
