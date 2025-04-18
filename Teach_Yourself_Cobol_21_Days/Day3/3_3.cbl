      *Adding extra paragraph names 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. ADD04.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION. 
       01  FIRST-NUMBER            PIC 99. 
       01  SECOND-NUMBER           PIC 99. 
       01  THE-RESULT              PIC 999.
      *
       PROCEDURE DIVISION. 
       PROGRAM-BEGIN.
           DISPLAY " This program adds 2 numbers.".
       GET-FIRST-NUMBER.
           DISPLAY "ENTER THE FIRST NUMBER.".
           ACCEPT FIRST-NUMBER. 
       GET-SECOND-NUMBER. 
           DISPLAY " ENTER THE SECOND NUMBER.". 
           ACCEPT SECOND-NUMBER. 

       COMPUTE-AND-DISPLAY.
           COMPUTE THE-RESULT = FIRST-NUMBER + SECOND-NUMBER. 
           DISPLAY "THE RESULT IS "THE-RESULT. 

       PROGRAM-DONE.
           STOP RUN.
           
