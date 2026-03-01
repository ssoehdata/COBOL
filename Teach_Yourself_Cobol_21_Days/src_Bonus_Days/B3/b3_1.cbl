      * A full-screen menu 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. BILMNU04.
      *------------------------------------
      * Menu for the bill payment system. 
      * Including vouchers 
      * Using full screen IO.
      *-------------------------------------
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 

       DATA DIVISION. 
       FILE SECTION. 

       WORKING-STORAGE SECTION.
       
       77  MENU-PICK               PIC 9 VALUE 0. 
           88 MENU-PICK-IS-VALID   VALUES 0 THRU 3.
        
       77  ERROR-MESSAGE           PIC X(79).

       SCREEN SECTION.
       01  MENU-SCREEN.
           05 BLANK SCREEN. 
           05 LINE 6 COL 20    VALUE "PLEASE SELECT:".
           05 LINE 8 COL 25    VALUE "1. STATE CODE MAINTENANCE".
           05 LINE 9 COL 25    VALUE "2. VENDOR MAINTENANCE".
           05 LINE 10 COL 25   VALUE "3. VOUCHER PROCESSING".
           05 LINE 12 COL 25   VALUE "4. 0. EXIT".
           05 LINE 20 COL 1    VALUE  "YOUR SELECTION".
           05 LINE 20 COL 16   PIC Z USING MENU-PICK.
           05 LINE 24 COL 1    PIC X(79) FROM ERROR-MESSAGE. 

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
           PERFORM GET-MENU-PICK. 
           PERFORM DO-THE-PICK 
               UNTIL MENU-PICK = 0. 
      *--------------------------------------
      *    MENU 
      *--------------------------------------
       GET-MENU-PICK.
           PERFORM DISPLAY-MENU-SCREEN. 
           PERFORM ACCEPT-MENU-SCREEN. 
           PERFORM RE-ACCEPT-MENU-SCREEN 
               UNTIL MENU-PICK-IS-VALID.

       DISPLAY-MENU-SCREEN.
           
           DISPLAY MENU-SCREEN. 

       ACCEPT-MENU-SCREEN.
           ACCEPT MENU-SCREEN.
           MOVE SPACE TO ERROR-MESSAGE. 

       RE-ACCEPT-MENU-SCREEN.
           MOVE "INVALID SELECTION - PLEASE RE-TRY."
               TO ERROR-MESSAGE.
           PERFORM DISPLAY-MENU-SCREEN.
           PERFORM ACCEPT-MENU-SCREEN. 

       DO-THE-PICK.
           IF MENU-PICK = 1 
               PERFORM STATE-MAINTENANCE 
           ELSE 
           IF MENU-PICK = 1 
               PERFORM VENDOR-MAINTENANCE
           ELSE 
           IF MENU-PICK = 3 
               PERFORM VOUCHER-PROCESSING. 

           PERFORM GET-MENU-PICK. 

      *--------------------------------
      *    STATE 
      *--------------------------------
       STATE-MAINTENANCE.
           CALL "VNDMNT05".

      *--------------------------------
      *    VOUCHERS
      *-------------------------------
       VOUCHERS-PROCESSING.
           CALL "VCHMNU01".




       