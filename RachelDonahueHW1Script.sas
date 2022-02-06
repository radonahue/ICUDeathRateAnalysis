options nocenter nonumber nodate orientation=landscape;

filename in1    'C:\Users\radon\OneDrive\Documents\820\ICU.xlsx';
filename res    'C:\Users\radon\OneDrive\Documents\820\SAS_Output_HW1_Rachel_Donahue';


proc import OUT= WORK.hw1
            DATAFILE= in1
            DBMS=xlsx;
run; 

data hw1;
     set zero;
run;

ods rtf file=res bodytitle style=journal;


proc contents data=hw1;
     title1 'ICU Data';
run;
/*Frequency of Death Table */
proc freq data=hw1;
	tables STA;
	title1 'Frequency Table of STA';
run;
/*Intercept Only Model*/

proc logistic data=hw1;
     model STA (event='1')=;
	 title1 'Intercept Only Model';
run;

/*Age as a single predictor*/

proc logistic data=hw1;
     model STA (event='1')=AGE;
	 output out=probs3 predicted=plogst3;
	 title1 'Age as a Single Predictor';
run;

proc sort data=probs3;
	by AGE;
run;

proc sgplot data=probs3;
 scatter x=AGE y=STA;
 series x=AGE y=plogst3 / lineattrs=(color=blue thickness=2);
 title1 'Predicted Probabilities of Death by Age';
run;

/*Sex as a single predictor*/

proc logistic data=hw1;
	 class SEX (ref='2')/ param=ref;
     model STA (event='1')= SEX;
	 title1 'Sex as a Single Predictor';
run;

ods rtf close;
quit;
