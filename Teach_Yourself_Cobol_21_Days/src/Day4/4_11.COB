      * Combining tests with AND
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. RANGE01.
      *****************************************************************
      * Asks user for a number between 10 and 100 exclusive and prints
      * a message if the entry is in range.
      *****************************************************************
       ENVIRONMENT DIVISION. 
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 

       01  THE-NUMBER              PIC 999.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM GET-THE-NUMBER.

           PERFORM CHECK-THE-NUMBER. 

       PROGRAM-DONE.
           STOP RUN. 
       GET-THE-NUMBER.
           DISPLAY "Enter a number greater than 10".
           DISPLAY "and less than 100. (011-099)".
           ACCEPT THE-NUMBER. 

       CHECK-THE-NUMBER.
           IF THE-NUMBER > 10  AND  
               THE-NUMBER < 100 
               DISPLAY "The number is in range.".


           

