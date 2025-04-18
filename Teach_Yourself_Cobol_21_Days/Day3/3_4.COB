      *Empty paragraph 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. ADD05.
       ENVIRONMENT DIVISION. 
       REMARKS.COMPILER-GNUCOBOL-3_2_0.            
       DATA DIVISION. 
      *
       WORKING-STORAGE SECTION. 
       01  FIRST-NUMBER               PIC 99.
       01  SECOND-NUMBER              PIC 99. 
       01  THE-RESULT                 PIC 999. 
      *
       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 
       STEP-01. 
           DISPLAY "This program will add 2 numbers.". 
           DISPLAY " PLEASE HIT THE ENTER KEY TO ADVANCE THE PROGRAM.".
           ACCEPT FIRST-NUMBER. 
       STEP-02.
           DISPLAY " ENTER THE FIRST NUMBER.".
           ACCEPT FIRST-NUMBER. 
       STEP-03.
           DISPLAY "ENTER THE SECOND NUMBER.".
           ACCEPT SECOND-NUMBER. 
       STEP-04.
           COMPUTE THE-RESULT = FIRST-NUMBER + SECOND-NUMBER. 
           DISPLAY "The result is " THE-RESULT. 

       PROGRAM-DONE. 
           STOP RUN. 


       