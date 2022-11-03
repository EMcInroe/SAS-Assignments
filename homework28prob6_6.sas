/***************************************************************
Homework 28 Problem 6.6
In this program a paired t-test is performed as well as a t-test 
as if they were not paired. In order to use the TTEST procedure, 
the data is transposed using arrays. 
***************************************************************/
OPTION NODATE NONUMBER;

data weights;
	input time $ subj1-subj12;
	array scores (12) subj1-subj12;
	array subjects (12) _temporary_ (1 2 3 4 5 6 7 8 9 10 11 12);
	do i = 1 to 12;
		subject = subjects(i);
		score = scores(i);
		output;
	end;
	drop i subj1-subj12;
DATALINES;
Before 300 350 190 400 244 321 330 250 190 160 260 240
After  290 331 200 395 240 300 332 242 185 158 256 220
;
RUN;

PROC SORT data = weights out=weightsrt;
	by subject;
RUN;

DATA south;
	set weightsrt;
	by subject;
	array allscores (2) Before After;
	if first.subject then i = 1;
		allscores(i) = score;
	if last.subject then output;
	i+1;
	retain Before;
	drop time i score;
PROC PRINT data = south NOOBS;
	title 'South Data Set';
RUN;
/************************************************************
paired t-test on the before and after weights. 
***********************************************************/
PROC TTEST data = south;
	Title 'Paired T-Test';
	PAIRED Before * After;
RUN;
/***********************************************************
T-test performed on data as if they were not paired. 
***********************************************************/
PROC TTEST data = weights;
	title 'T-test not paired';
	Class time;
	var score;
Run;
