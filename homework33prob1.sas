
OPTIONS NODATE NONUMBER;

%LET cutoff = 70;

PROC FORMAT;
	value statusfmt 1 = 'Failed'
				    2 = 'Passed';
RUN;

data grade_status;
	set grades (keep = grade);
	if grade GE &cutoff then Status = 2;
else if grade LT &cutoff then Status = 1;
format status statusfmt.;
RUN;


PROC FREQ data = grade_status ;
	title 'Grade Distribution When Cutoff = 70';
	table status /list NOCUM;
RUN;



