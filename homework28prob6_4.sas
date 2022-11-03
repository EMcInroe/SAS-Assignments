/**********************************************
Homework 28 Problem 6.4
In this program we performa t-test on variables 
X and Y only using groups A and C. The where 
statement is used to specify which groups to 
include in the t-test. 
*********************************************/
OPTIONS NODATE NONUMBER;
 
PROC TTEST data = ques6_4;
	title 'Ques6_4 T-test';
	Class Group;
	where group = 'A' | group = 'C';
	Var X Y;
RUN;
