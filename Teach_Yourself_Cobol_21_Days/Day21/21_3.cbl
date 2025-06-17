       IDENTIFICATION DIVISION.
       PROGRAM-ID. VCHCLR01.
      *---------------------------------
      * Asks the user if all selected 
      * vouchers should be cleared.
      * 
      * 1. Searches the voucher file for 
      *    unpaid vouchers that are 
      *    selected and clears the 
      *    selected flag 
      *--------------------------------- 
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           COPY "SLVOUCH.CBL".
           
       DATA DIVISION.
       FILE SECTION.

           COPY "FDVOUCH.CBL".

       WORKING-STORAGE SECTION.

       77  OK-TO-CLEAR             PIC X.
       77  VOUCHER-FILE-AT-END     PIC X. 

           COPY "WSCASE01.CBL". 

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
           OPEN I-O VOUCHER-FILE. 

       CLOSING-PROCEDURE.
           CLOSE VOUCHER-FILE.

       MAIN-PROCESS.
           PERFORM GET-OK-TO-CLEAR.
           IF OK-TO-CLEAR = "Y" 
               PERFORM PROCESS-VOUCHERS. 

       GET-OK-TO-CLEAR.
           PERFORM ACCEPT-OK-TO-CLEAR. 
           PERFORM RE-ACCEPT-OK-TO-CLEAR 
               UNTIL OK-TO-CLEAR = "Y" OR "N".

       ACCEPT-OK-TO-CLEAR.
           DISPLAY "CLEAR ALL PREVIOUS SELECTIONS (Y/N)?".
           ACCEPT OK-TO-CLEAR.
           INSPECT OK-TO-CLEAR 
               CONVERTING  LOWER-ALPHA 
               TO          UPPER-ALPHA.

       RE-ACCEPT-OK-TO-CLEAR.
           DISPLAY "YOU MUST ENTER YES OR NO".
           PERFORM ACCEPT-OK-TO-CLEAR. 

      *----------------------------------------
      * Clear all previous selections.
      *---------------------------------------- 
       PROCESS-VOUCHERS.
           PERFORM READ-FIRST-VALID-VOUCHER.
           PERFORM PROCESS-ALL-VOUCHERS 
               UNTIL VOUCHER-FILE-AT-END = "Y".

       PROCESS-ALL-VOUCHERS.
           PERFORM PROCESS-THIS-VOUCHER.
           PERFORM READ-NEXT-VALID-VOUCHER.

       PROCESS-THIS-VOUCHER.
           MOVE "N" TO VOUCHER-SELECTED 
           PERFORM REWRITE-VOUCHER-RECORD.

      *-----------------------------------
      * Read first, read next routines
      *-----------------------------------
       READ-FIRST-VALID-VOUCHER. 
           PERFORM READ-NEXT-VALID-VOUCHER.

       READ-NEXT-VALID-VOUCHER.
           PERFORM READ-NEXT-VOUCHER-RECORD. 
           PERFORM READ-NEXT-VOUCHER-RECORD 
               UNTIL VOUCHER-FILE-AT-END = "Y"
                   OR (  VOUCHER-PAID-DATE = ZEROES
                       AND VOUCHER-SELECTED = "Y").

       READ-NEXT-VOUCHER-RECORD.
           MOVE "N" TO VOUCHER-FILE-AT-END.
           READ VOUCHER-FILE NEXT RECORD 
               AT END 
                   MOVE "Y" TO VOUCHER-FILE-AT-END.

      *-------------------------------------------------
      * Other File I-O Routines.
      *------------------------------------------------- 
       REWRITE-VOUCHER-RECORD.
           REWRITE VOUCHER-RECORD 
               INVALID KEY 
               DISPLAY "ERROR REWRITING VENDOR RECORD".
                
      

