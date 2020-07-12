PROC IMPORT OUT= WORK.Flu 
            DATAFILE= "C:\Users\MITROVICS2\Desktop\Flu.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="Flu$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
*PT 1;
PROC PLOT DATA= Flu;
PLOT incidence*temperature;
RUN;

*#1- from the scatterplot you can observe that as the temperature increases, the number of influenza incidents decreases over each documented regions;

*PT 2;
*Title;
title1 "Incidence vs. Temperature";
*y-axis title;
axis2 label = ("Temperature (C)");
*symbols;
symbol1 color = red value = dot interpol = spline;
PROC GPLOT DATA= Flu;
  PLOT incidence*temperature/ VAXIS = axis1 ;
RUN;
QUIT;

*#2- You can observe that there is a direct negative correlation between temperature and incidence and little to no outliers in the dataset;

*PT 3;
PROC SGPLOT DATA = Flu;
  SCATTER X = temperature Y = incidence;
RUN;

*#3- As the temperature increases, the variance of the incidence reported decreases. The number of incidence decelerates as Tempertaure increases;

*PT 4;
PROC SGPLOT DATA= Flu;
  SCATTER X=temperature Y=incidence / group=region;
RUN;

*#4 - Incidencein this dataset are greatest in the Northeast when the temperature is low is comparison to the other 2 regions. The region with the greatest reporting at the highest temperature
is the upper midwest, the northwest has the lowest reporting of incidence overall;

*PT 5;

PROC REG DATA = Flu;
	MODEL incidence = temperature;
RUN;

*#5 - The Root MSE / Dependent Mean = a coefficient of 1.36;

*PT 6;
PROC REG DATA = Flu;
model region = northwest northeast uppermidwest;
RUN;
QUIT;

* should have subset data from northwest, northeast, and uppermidwest and then ran PROC REG DATA on each subset dataset, did not have enough time.;
