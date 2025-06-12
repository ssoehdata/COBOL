      * Using the COPY files for data handling.

       IDENTIFICATION DIVISION. 
       PROGRAM-ID. DATE06.
      *---------------------------------------------
      * Testing Date Entry and handling
      *--------------------------------------------- 
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL.

       DATA DIVISION. 
       FILE SECTION. 

       WORKING-STORAGE SECTION. 

       77  ANY-DATE                    PIC 9(8) VALUE ZEROES.
       77  REQUIRED-DATE               PIC 9(8) VALUE ZEROES. 

           COPY "WSDATE01.CBL".

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 
           PERFORM OPENING-PROCEDURE.
           PERFORM MAIN-PROCESS.
           PERFORM CLOSING-PROCEDURE.

       PROGRAM-EXIT.
           EXIT PROGRAM.

       PROGRAM-DONE. 
           STOP RUN. 

       OPENING-PROCEDURE.

       CLOSING-PROCEDURE.

       MAIN-PROCESS.
           PERFORM GET-TWO-DATES.
           PERFORM DISPLAY-AND-GET-DATES 
               UNTIL REQUIRED-DATE = 00010101.

       GET-TWO-DATES. 
           PERFORM GET-ANY-DATE.
           PERFORM GET-REQUIRED-DATE. 

       GET-ANY-DATE.
           MOVE "Y" TO ZERO-DATE-IS-OK.
           MOVE "ENTER AN OPTIONAL MM/DD/CCYY?" TO DATE-PROMPT.
           MOVE "MUST BE ANY VALID DATE" TO DATE-ERROR-MESSAGE.
           PERFORM GET-A-DATE.
           MOVE DATE-CCYYMMDD TO ANY-DATE.

       GET-REQUIRED-DATE. 
           MOVE "N" TO ZERO-DATE-IS-OK.
           MOVE SPACE TO DATE-PROMPT.
           MOVE "MUST ENTER A VALID DATE" TO DATE-ERROR-MESSAGE. 
           PERFORM GET-A-DATE.
           MOVE DATE-CCYYMMDD TO REQUIRED-DATE. 

       DISPLAY-AND-GET-DATES.
           PERFORM DISPLAY-THE-DATES.
           PERFORM GET-TWO-DATES.

       DISPLAY-THE-DATES. 
           MOVE ANY-DATE TO DATE-CCYYMMDD.
           PERFORM FORMAT-THE-DATE.
           DISPLAY "ANY DATE IS " FORMATTED-DATE.
           MOVE REQUIRED-DATE TO DATE-CCYYMMDD. 
           PERFORM FORMAT-THE-DATE.           
           DISPLAY "REQUIRED DATE IS " FORMATTED-DATE.

           COPY "PLDATE01.CBL".

