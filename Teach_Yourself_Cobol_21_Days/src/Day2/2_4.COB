       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD01.
       ENVIRONMENT DIVISION. 
       DATA DIVISION. 

       WORKING-STORAGE SECTION.

       01  FIRST-NUMBER        PICTURE IS 99.
       01  SECOND-NUMBER       PICTURE IS 99.
       01  THE-RESULT          PICTURE IS 999.

       PROCEDURE DIVISION. 

       PROGRAM-BEGIN.

           DISPLAY "ENTER THE FIRST NUMBER.".

           ACCEPT FIRST-NUMBER.

           DISPLAY "ENTER THE SECOND NUMBER.".

           ACCEPT SECOND-NUMBER.  

           COMPUTE THE-RESULT = FIRST-NUMBER + SECOND-NUMBER.
           
      * makling the display a one-line.
           DISPLAY "THE RESULT IS:" THE-RESULT.
      *    DISPLAY THE-RESULT.


       PROGRAM-DONE.
           STOP RUN.



                               