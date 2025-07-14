      * Numeric Intrinsic Functions 

      * This program uses the REM Intrinsic function, which behaves as a
      * numeric data item. Numeric functions can not be used as the 
      * source of a MOVE statement in Microfocus Cobol and some other 
      * compilers. 

       IDENTIFICATION DIVISION. 
       PROGRAM-ID. REMEX. 
       AUTHOR. MO BUDLONG.
       DATE-WRITTEN. 09/07/96.
       DATE-COMPILED. 
       SECURITY. NONE. 
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
       DATA DIVISION. 
       FILE SECTION. 
       WORKING-STORAGE SECTION. 

       01  NUMERIC-1               PIC 9(9). 
       01  NUMERIC-2               PIC 9(2).
       01  NUMERIC-3               PIC 9(9).

       01  DUMMY                   PIC X. 

       PROCEDURE DIVISION. 
       MAIN-LOGIC SECTION. 

       PROGRAM-BEGIN.
           
           PERFORM OPENING-PROCEDURE. 
           PERFORM MAIN-PROCESS. 
           PERFORM CLOSING-PROCEDURE. 

       EXIT-PROGRAM. 
           EXIT PROGRAM. 
       STOP-RUN. 
           STOP RUN.

       THE-OTHER SECTION. 
       
       OPENING-PROCEDURE. 
       CLOSING-PROCEDURE. 
       MAIN-PROCESS.
           MOVE 1 TO NUMERIC-1, NUMERIC-2. 
           PERFORM ENTER-PARAMETERS.
           PERFORM TEST-REM UNTIL 
               NUMERIC-1 = 0
            OR NUMERIC-2=0.

       ENTER-PARAMETERS.
           DISPLAY "ENTER LARGER NUMBER (0 TO QUIOT)".
           ACCEPT NUMERIC-1. 

           IF NUMERIC-1 NOT = 0
               DISPLAY "ENTER SMALLER NUMBER (0 TO QUIT)"
               ACCEPT NUMERIC-2. 

       TEST-REM. 
           COMPUTE NUMERIC-3 = 
               FUNCTION REM (NUMERIC-1, NUMERIC-2).

               DISPLAY "REMAINDER OF " NUMERIC-1 "/" NUMERIC-2 " IS ".
               DISPLAY NUMERIC-3.
               DISPLAY "PRESS ENTER TO CONTINUE . . . "
               ACCEPT DUMMY. 

               PERFORM ENTER-PARAMETERS. 

       