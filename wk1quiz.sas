data week1;
input Fert $ Height;
datalines;
F1 32
F1 30.5
F1 25
F1 27.5
F1 28
F1 28.6
F2 22.5
F2 26
F2 28
F2 27
F2 26.5
F2 25.2
F3 28
F3 27.5
F3 31
F3 29.5
F3 30
F3 29.2
Control 21
Control 19.5
Control 22.5
Control 21.5
Control 20.5
Control 21
;

proc print data=week1;
title 'Raw Data for Week 1 Lesson'; run;

proc summary data=week1;
class fert;
var height;
output out=output1 mean=mean stderr=se;
run;

proc print data=output1;
title 'Summary Output for Week 1 Lesson';
run;
