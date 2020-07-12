*Simonida Mitrovic;
*00741316;
DATA data1;

INPUT ID $ SEX $ DOSE T1 T2 T3 T4;
DATALINES;
  n01 M 0.1 71 76 73 77
n13 F 0.1 50 71 73 71
n15 F 0.1 72 73 71 70
c02 M 0.0 86 87 88 89
c03 F 0.0 81 83 82 81
c04 M 0.0 91 94 90 93
n14 F 0.1 69 70 73 69
c16 F 0.0 90 86 89 88
n05 F 0.1 71 76 73 71
n06 M 0.1 72 69 71 68
c07 M 0.0 86 87 89 87
c08 F 0.0 86 89 90 91
c09 F 0.0 89 87 89 83
c10 F 0.0 88 87 90 84
c11 M 0.0 88 89 91 88
c17 M 0.0 89 90 91 90
n18 F 0.1 73 69 72 71
n12 M 0.1 69 72 73 70
n19 M 0.1 68 71 71 71
n20 F 0.1 72 70 68 69
;
RUN;

PROC TTEST DATA = DATA1;
h0 = 75
sides = 2;
VAR T1 T2 T3 T4;
RUN;
*T1 Pvalue is 0.2236, T2 Pvalue is 0.0237, T3 Pvalue is 0.0157, T4 Pvalue is 0.0613;
*Using a confidence level of 0.05 we would reject the null hypotheis's of T2 and T3
and accept the null for T1 and T4;

PROC TTEST DATA = DATA1;
Class sex;
VAR T1 T2 T3 T4;
RUN;
PROC TTEST DATA = DATA1;
PAIRED T2*T1;
RUN;

*#1: the treatment Repoxodin does not cause significant statistically 
different mean responses for each taste, but the mean is not 
a good method for analyzing the distribution.;

*#2: gender does not influence the mean response for each task. 
the hypothesis whether repoxodin treats influenza H0, the alternative\
Ha is that it does not. The test is the samples taken in the data set. 
The decision rule would be the confidence interval of the test.
Using the confidence level of 0.05 we accept the null hypothesis for T1 and T4
and reject it for T2 and T3.;

*#3: The assumptions for the test are met, but not with outstanding 
statistical relevance.;
