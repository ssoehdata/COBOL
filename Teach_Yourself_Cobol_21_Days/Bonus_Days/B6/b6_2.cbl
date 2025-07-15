      * Adds days to a date 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. DADD.
       AUTHOR. MO BUDLONG. 
       INSTALLATION. 
       DATE-WRITTEN. 09/07/96.
       DATE-COMPILED. 15/07/25.
       SECURITY. NONE. 
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
       DATA DIVISION. 
       FILE SECTION.
       WORKING-STORAGE SECTION. 

       01  CD-DATE.
           05 CD-YYYYMMDD          PIC 9(8). 
           05 FILLER               PIC X(13).
       01  NEW-DATE                PIC 9(8).
       01  DAYS-TO-ADD             PIC S9(5).
       01  FORMAT-DAYS-TO-ADD      PIC ZZZZ9-.

       01  DUMMY PIC X. 

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
           MOVE 1 TO DAYS-TO-ADD.
           PERFORM ENTER-PARAMETERS.
           PERFORM TEST-DADD UNTIL 
               DAYS-TO-ADD = 0. 

       ENTER-PARAMETERS.
           DISPLAY "ENTER NUMBER-OF-DAYS TO ADD (0 TO QUIT)".
           ACCEPT DAYS-TO-ADD.
           MOVE DAYS-TO-ADD TO FORMAT-DAYS-TO-ADD.

       TEST-DADD.
           MOVE FUNCTION CURRENT-DATE TO CD-DATE. 

           COMPUTE NEW-DATE = 
               FUNCTION DATE-OF-INTEGER(
                   FUNCTION INTEGER-OF-DATE(CD-YYYYMMDD)
                   + DAYS-TO-ADD).

           DISPLAY "CURRENT DATE " CD-YYYYMMDD 
               " + " FORMAT-DAYS-TO-ADD 
               " WILL BE " NEW-DATE.

           PERFORM ENTER-PARAMETERS. 

       