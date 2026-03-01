      * Creating a Voucher file 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. VCHBLD01.
      *----------------------------------------------------------
      * Create a Voucher file for the bills payment system. 
      *-----------------------------------------------------------
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           
           COPY "SLVOUCH.CBL".

       DATA DIVISION. 
       FILE SECTION. 
           
           COPY "FDVOUCH.CBL".

       WORKING-STORAGE SECTION. 

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 
           OPEN OUTPUT VOUCHER-FILE. 
           CLOSE VOUCHER-FILE. 

       PROGRAM-EXIT. 
           EXIT PROGRAM. 

       PROGRAM-DONE. 
           STOP RUN. 
       