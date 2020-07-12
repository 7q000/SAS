PROC IMPORT OUT= WORK.RXDATA 
            DATAFILE= "C:\Users\mitrovics2\Desktop\RXData.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="'RXData(2)$'"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
