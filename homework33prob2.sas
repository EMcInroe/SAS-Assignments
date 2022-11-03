/*****************************************************
Homework 33 Problem 2
In this program a macro is created and used to summarize
grades based on different cutoffs.
*****************************************************/
OPTIONS NODATE NONUMBER;

PROC FORMAT;
	value statusfmt 1 = 'Failed'
				    2 = 'Passed';
RUN;

*creates macro with parameter "cutoff";
%MACRO GRADECUTS (cutoff =);
data grade_status;
	set grades (keep = grade);
	if grade GE &cutoff then Status = 2;
else if grade LT &cutoff then Status = 1;
format status statusfmt.;
RUN;
PROC FREQ data = grade_status ;
	title "Grade Distribution When Cutoff = &cutoff";
	table status /list NOCUM;
RUN;
%MEND GRADECUTS;   *tells SAS to end macro creation;

*invokes macro based on different cutoff scores;
%GRADECUTS (cutoff = 60);

%GRADECUTS (cutoff = 70);

%GRADECUTS (cutoff = 80);



