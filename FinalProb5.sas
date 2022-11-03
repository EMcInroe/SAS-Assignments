/*************************************************************************
Final Problem 5
In this program data is read from a previously created data set. PROC SORT
is used to create the first.subj and last.subj variables. FREQ procedure 
is used to create a table 5X3 table between years and score. The Chi-square
analysis and the CMH analysis are also completed to be able to interpret the 
association between years and score. 
*************************************************************************/
LIBNAME sasfiles 'C:\users\eudoc\documents\statistics\stats482\sasfiles';
OPTIONS NODATE NONUMBER;

PROC SORT data = sasfiles.qul out = qulsrt;
	by subj v_date;
RUN;

 PROC FORMAT;
   value scorefmt LOW-<0  = 'Better'
                 0<-HIGH  = 'Worse'
                        0 = 'NoChange'
                      .   = 'Missing';
 RUN;

Data improve;
	set qulsrt (keep= subj v_date qul_1); *unnecesary variables are dropped;
	by subj v_date;
	if first.subj then do;                *variables based on the first visit are created;
		first_visit = v_date;
	    first_qul = qul_1;
	end;
	if last.subj then do;                *variabless based on the last visit are created;
		last_visit = v_date;
	    last_qul = qul_1;
	end;
	if last.subj = 0 then delete;         
	retain first_visit first_qul;        *values retained to be used in calculations;
	years = ROUND(yrdif(first_visit, last_visit, 'ACT/ACT'));
	score = first_qul-last_qul;
	format score scorefmt.;
Run;

PROC FREQ data = improve;
	title'Final Problem 5';
	TABLES years*score / NOPERCENT NOCOL CHISQ CMH;
RUN;



