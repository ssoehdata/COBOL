      * Creating a new state code file
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. STCBLD01. 
      *--------------------------------------------------
      * Create an Empty State Code File. 
      * This program open output for a new state file.
      *-------------------------------------------------- 
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           
           COPY "SLSTATE.CBL".

       DATA DIVISION. 
       FILE SECTION. 
           
           COPY "FDSTATE.CBL".

       WORKING-STORAGE SECTION. 

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 
           OPEN OUTPUT STATE-FILE. 
           CLOSE STATE-FILE.

       PROGRAM-DONE.
           STOP RUN. 
