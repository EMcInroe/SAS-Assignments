/**********************************************************************
Final Problem 3
In this program at data set is created that contains 100 observations 
and 2 character variables. A random number is generated for each 
observation using the RANUNI function. Rater1 and Rater2 are given 
values for each observation based on the random number. Then the FREQ
procedure is used with the AGREE option to find the Kappa Coefficient 
to measure the agreement between rater1 and rater2. A macro is also 
created so that the cutoff values can be easily changed. 
**********************************************************************/
OPTIONS NODATE NONUMBER;

Data setup;
	do OBS = 1 to 100;
		output;
	End;
RUN; 

PROC FORMAT;
	value ratefmt 1 = 'YES'
	              2 = 'NO';
RUN;

*creates macro with 3 parameters for cutoff;
%MACRO ratagree (cutoff1=, cutoff2=, cutoff3=);
Data agree;
	set setup;
	random = ranuni(456);
	if random lt &cutoff1 then do;
		rater1 = 1; 
		rater2 = 1;
	end;
    if random ge &cutoff1 and random lt &cutoff2 then do; 
			rater1 = 1; 
			rater2= 2;
		end;
    if random ge &cutoff2 and random lt &cutoff3 then do; 
			rater1 = 2; 
			rater2 = 1;
		end;
    if random ge &cutoff3 then do; 
			rater1 = 2; 
			rater2 = 2;
		end;
format rater1 rater2 ratefmt.;
drop random;
Run;

PROC FREQ data = agree;
	title1 'Kappa Coefficient Rater1 and Rater2';
	title2 "Cutoff Values &cutoff1, &cutoff2, and &cutoff3";
	tables rater1*rater2 / AGREE;
RUN;

%MEND ratagree;

%ratagree (cutoff1 = .4, cutoff2=.5, cutoff3=.6);
%ratagree (cutoff1 = .2, cutoff2=.5, cutoff3=.8);
