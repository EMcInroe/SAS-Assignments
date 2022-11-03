/************************************************************************
Homework 34 Problem 1
In this program a random sample of subjects from the ICDB study is 
selected to participate in a survey. The SURVEYSELECT procedure method is 
used to generate the random sample of unequalsized groups without replace-
ment. The data is first sorted by sex so that it can be used in the 
procedure. A new data set is created. The method used is SRS (simple 
random sampling). The samprate determines the number of subject. Both 
males and females have a sample size of 10% subjects from the group. 
************************************************************************/
LIBNAME sasfiles 'C:\users\eudoc\documents\statistics\stats482\sasfiles';
OPTIONS NODATE NONUMBER;
 
PROC SORT data = sasfiles.back_1 out = backsrt;
	by sex;
RUN;
	
PROC SURVEYSELECT data = backsrt
		out = randsamp
		method = SRS
		seed = 1004
		samprate = (0.1 0.1);
Strata sex;                     *sorted in groups by sex;
Run;

*prints subjects in random sample;
PROC PRINT data = randsamp NOOBS;
	title 'ICDB Study Random Sample';
	var sex subj v_date b_date;
RUN;
