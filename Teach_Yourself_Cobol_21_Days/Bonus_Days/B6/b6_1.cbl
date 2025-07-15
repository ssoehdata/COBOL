       IDENTIFICATION DIVISION. 
       PROGRAM-ID. DOW.
       AUTHOR. MO BUDLONG.
       INSTALLATION. 
       DATE-WRITTEN. 09/07/96.
       DATE-COMPILED. 
       SECURITY. NONE. 
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION. 
       WORKING-STORAGE SECTION. 

       01  CD-DATE.   
           05 CD-YYYYMMDD              PIC 9(8).
           05 FILLER                   PIC X(13).
       01  THE-DATE                    PIC 9(8).
       01  ANSI-DATE                   PIC  9(6).
       01  THE-DOW                     PIC 9. 
       01  DAYS-OF-WEEK.
           05 FILLER                   PIC X(9) VALUE "SUNDAY".
           05 FILLER                   PIC X(9) VALUE "MONDAY".           
           05 FILLER                   PIC X(9) VALUE "TUESDAY".
           05 FILLER                   PIC X(9) VALUE "WEDNESDAY".
           05 FILLER                   PIC X(9) VALUE "THURSDAY".
           05 FILLER                   PIC X(9) VALUE "FRIDAY".
           05 FILLER                   PIC X(9) VALUE "SATURDAY".
       01  FILLER REDEFINES DAYS-OF-WEEK.
           05 THE-DAY                  PIC X(9) OCCURS 7 TIMES. 

       01  DOW-SUB                     PIC 9. 

       01  DUMMY         PIC X. 

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
           MOVE 1 TO THE-DATE. 
           PERFORM ENTER-PARAMETERS. 
           PERFORM TEST-DOW UNTIL 
               THE-DATE = 0. 

       ENTER-PARAMETERS.
           DISPLAY "ENTER A DATE IN YYYYMMDD FORTMAT (0 TO QUIT)".
           ACCEPT THE-DATE. 

       TEST-DOW. 
           MOVE FUNCTION CURRENT-DATE TO CD-DATE. 

           COMPUTE ANSI-DATE = FUNCTION INTEGER-OF-DATE(CD-YYYYMMDD).
           COMPUTE THE-DOW = FUNCTION REM(ANSI-DATE,7).
           COMPUTE DOW-SUB = THE-DOW + 1.

           DISPLAY "TODAY IS  " CD-YYYYMMDD " A " 
               THE-DAY(DOW-SUB).

           COMPUTE DOW-SUB = FUNCTION REM( 
               FUNCTION INTEGER-OF-DATE(THE-DATE), 7) + 1.

           DISPLAY "PRESS ENTER TO CONTINUE . . ."
           ACCEPT DUMMY. 

           PERFORM ENTER-PARAMETERS. 


           
           


          