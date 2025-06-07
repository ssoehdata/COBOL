      * Creating a control file with an initial record 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. CTLBLD01.
      *----------------------------------------------------------
      * Create a Control file for the bills payment system and 
      * write the initial record. 
      *----------------------------------------------------------
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL.

           COPY "SLCONTRL.CBL".

       DATA DIVISION. 
       FILE SECTION. 

           COPY "FDCONTRL.CBL".

       WORKING-STORAGE SECTION.

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 
           OPEN OUTPUT CONTROL-FILE.
           MOVE 1 TO CONTROL-KEY.
           MOVE ZEROES TO CONTROL-LAST-VOUCHER.
           WRITE CONTROL-RECORD.
           CLOSE CONTROL-FILE.

       PROGRAM-EXIT. 
           EXIT PROGRAM. 

       PROGRAM-DONE.
           STOP RUN. 
           
     