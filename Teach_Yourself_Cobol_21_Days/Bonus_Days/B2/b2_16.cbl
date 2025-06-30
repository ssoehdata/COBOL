      * The called program 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. TIMEDIT.
      *--------------------------------------------------
      * TIME ENTRY AND VALIDATION SUB PROGRAM
      *-------------------------------------------------
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 

       DATA DIVISION. 
       FILE SECTION. 

       WORKING-STORAGE SECTION. 

       77  VALID-TIME-FLAG         PIC X. 
           88 TIME-IS-INVALID      VALUE "N".
           88 TIME-IS-ZERO         VALUE "0".
           88 TIME-IS-VALID        VALUE "Y".
           88 TIME-IS-OK           VALUES "Y" "0".

       LINKAGE SECTION. 
      *------------------------------------
      * Fields passed for the TIME routines 
      *------------------------------------
       77  FORMATTED-TIME          PIC Z9/99/99.

       01  TIME-HHMMSS             PIC 9(6). 
       01  FILLER REDEFINES        TIME-HHMMSS. 
           05 TIME-HH              PIC 99. 
           05 TIME-MM              PIC 99. 
           05 TIME-SS              PIC 99. 

       77  ZERO-TIME-IS-OK         PIC X VALUE "N".

       PROCEDURE DIVISION 
           USING TIME-HHMMSS FORMATTED-TIME 
                 ZERO-TIME-IS-OK.

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
           PERFORM GET-A-TIME. 
       
       GET-A-TIME.
           PERFORM ACCEPT-A-TIME.
           PERFORM RE-ACCEPT-A-TIME 
               UNTIL TIME-IS-OK.

       ACCEPT-A-TIME.
           DISPLAY "ENTER A TIME (HH:MM:SS)".

           ACCEPT FORMATTED-TIME. 

           PERFORM EDIT-CHECK-TIME.

       RE-ACCEPT-A-TIME.
           DISPLAY "INVALID TIME". 

           PERFORM ACCEPT-A-TIME. 

       EDIT-CHECK-TIME. 
           PERFORM EDIT-TIME. 
           PERFORM CHECK-TIME.
           PERFORM FORMAT-THE-TIME. 

       EDIT-TIME.
           MOVE FORMATTED-TIME TO TIME-HHMMSS. 

       CHECK-TIME. 
           MOVE "Y" TO VALID-TIME-FLAG. 

           IF TIME-HHMMSS = ZEROES 
               IF ZERO-TIME-IS-OK = "Y"
                   MOVE "0" TO VALID-TIME-FLAG 
               ELSE 
                   MOVE "N" TO VALID-TIME-FLAG 
           ELSE 
           IF TIME-HH > 24 
               MOVE "N" TO VALID-TIME-FLAG 
           ELSE 
           IF TIME-MM > 59 
               MOVE "N" TO VALID-TIME-FLAG 
           ELSE 
           IF TIME-SS > 59
               MOVE "N" TO VALID-TIME-FLAG 
           ELSE 
           IF TIME-HHMMSS > 240000 
               MOVE "N" TO VALID-TIME-FLAG.

       FORMAT-THE-TIME. 
           MOVE TIME-HHMMSS TO FORMATTED-TIME.
           INSPECT FORMATTED-TIME 
               REPLACING ALL "/" BY ":".
       
           