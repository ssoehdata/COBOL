      * Maintaining a file with alternate keys 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VNDMNT03.
      *------------------------------------------
      * Add, Change, Inquire  and Delete 
      * for  the Vendor File. 
      *------------------------------------------ 
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL.

           COPY "SLVNDO2.CBL".

           COPY  "SLSTATE.CBL".

       DATA DIVISION. 
       FILE SECTION. 

           COPY "FDVND04.CBL".

           COPY "FDSTATE.CBL".
           