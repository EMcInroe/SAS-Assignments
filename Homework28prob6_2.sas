/***************************************************************
Homework 28 Problem 6.2
In this program two types of tests procedures are used. The data 
is first transposed using using 2 arrays so that the values can 
be analyzed in the test procedures. Program is the independent 
variable and is specified in the CLASS statement.  Score is the
dependent variable and is specified in the VAR statement. 
***************************************************************/
OPTIONS NODATE NONUMBER;

Data read;
	input program $ score1-score14;
array allscores (14) score1-score14;
array subj (14) _temporary_ (1 2 3 4 5 6 7 8 9 10 11 12 13 14);
	do i = 1 to 14;
	subject = subj(i);
	score = allscores(i);
	output;
End;
	drop i score1-score14; 
DATALINES;
Cody  500 450 505 404 555 567 588 577 566 644 511 522 543 578
Smith 355 388 440 600 510 501 502 489 499 489 515 520 520 480
;
RUN;

*T-test performed on the data;
PROC TTEST data = read;
	Title 'T-Test Problem 6.2';
	Class program;
	Var score;
RUN;

*EXACT WILCOXON rank-sum test performed on the data;
PROC NPAR1WAY data = read WILCOXON;
	Title 'WILCOXON TEST Problem 6.2';
	Class program;
	Var score;
	EXACT WILCOXON;
RUN;


