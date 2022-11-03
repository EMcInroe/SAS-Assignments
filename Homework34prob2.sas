/***************************************************
Homework 34 Problem 2
In this program a plan is created to randomly assign
32 students to one of the four teaching methods. 
***************************************************/
OPTIONS NODATE NONUMBER;

*do loop creates number for each student;
Data students;
	DO ID = 1 to 32;
		OUTPUT;
	End;
RUN;

*generates random number for each student;
Data randstuds;
	set students;
	random = ranuni(8642);
RUN;

*students sorted by random number;
PROC SORT data = randstuds;
	by random;
RUN;

*assigns students to method based on order of sorted;
Data randstuds;
	set randstuds;
	if _N_ le 8 then Method = 'A';
else if _N_ gt 8 and _N_ le 16 then Method = 'B';
else if _N_ gt 16 and _N_ le 24 then Method = 'C';
else if _N_ gt 24 and _N_ le 32 then Method = 'D';
drop random;
RUN;

*sorts students by ID number;
PROC SORT data = randstuds;
	by ID;
RUN;

*prints list of assigned methods;
Proc Print data = randstuds NOOBS LABEL;
	title 'Random Assignment for Teaching Method';
	label ID = 'Student ID'
			Method = 'Teaching Method';
Run;
