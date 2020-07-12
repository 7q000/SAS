*Create a new Library;
LIBNAME SASDATA 'C:\Users\mitrovics2\Documents';

DATA sasdata.RXData;
SET RXData;
Run;

DATA RXData1;
SET RXData;
Time = Time1;
DROP Time1 Time2 Time3;
RUN;

DATA RXData2;
SET RXData;
Time = Time2;
DROP Time1 Time2 Time3;
RUN;

DATA RXData3;
SET RXData;
Time = Time3;
DROP Time1 Time2 Time3;
RUN;

DATA sasdata.RxdataLONG;
	SET RXData1 RXData2 RXData3;
RUN;

*One way ANOVA;
*Null hypothesis H0: is that mu1 = mu2 = mu3;
*HA: at least 2 mu are different;
PROC glm data = sasdata.RXData;
Class treatment;
Model Time3 = Treatment;
Run;
Quit;
*pvalue <.0001 which implies that differences do exist across treatment groups;
*this is what we are looking for the differences across all of the Times;

*Hypothesis: H0: mu1 = mu2 = mu3
             HA: at least 2 mu are different;
*Our significance level is going to be 0.0001, 
which tells us the data is statistically significant
if it falls within any part of the distribution 
less than 0.0001, as it provides the null hypothesis 
would be rejected;

*Decision Rule: Reject the null hypothesis because the time 
has provided that they fall within p < 0.0001 for the mean;

*Conclusion: at the 0.0001 level of significance, the evidence 
suggests that at least 2 of the means for time in our distribution 
are different. This tells us that the drug did not have 
consistent effects between the control and Groups M,H,L.

*Tukey's HSD;
PROC glm data = sasdata.Rxdata;
Class treatment;
Model time1 = treatment;
LSMEANS treatment / ADJUST = tukey;
Run;
Quit;
