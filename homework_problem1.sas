/************************************************************
Homework 23 Problem 1
Erin McInroe
In this program I use the data set created by Ron Cody as the 
base. I then modified the data set by using various SAS character
functions to create the output shown in the homework instructions.
************************************************************/
OPTIONS NODATE NONUMBER;

DATA address ;
    INPUT #1 @1 line1 $50.
	      #2 @1 line2 $50.
		  #3 @1 line3 $50.;
	first_name = scan(line1, 2);                           *returns just the first name form line1;
	last_name = scan(line1,-1);                            *returns just the last name from line1;
	name = ':' || catx(' ',first_name,last_name) || ':';   *concatenates first and last separated by one blank;
	street = ':' || compbl(trim(line2)) || ':';            *reduces blanks to just one between, adds colons;
	street = tranwrd(street,'Street','St.');               
	street = tranwrd(street,'Avenue','Ave.');              *replaces words for abreviations;
	street = tranwrd(street,'Road','Rd.');
	city = ':'|| compbl(trim(line3))||':';                 *reduces blanks to one between, adds colons;
	drop line1 line2 line3 first_name last_name;           *drops variables from data set;
DATALINES;
Mr.  Jason    Simmons
123  Sesame  Street
Madison, WI
Dr.    Justin  Case
78    River  Road
Flemington, NJ
Ms. Marilyn  Crow
777 Jewell   Avenue
Pittsburgh,    PA
;
RUN;

PROC PRINT data = address NOOBS;
	title 'The address data set';
Run;
