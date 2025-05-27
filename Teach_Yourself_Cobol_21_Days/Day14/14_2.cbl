      * Physical description of an indexed file
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       SELECT VENDOR-FILE 
           ASSIGN TO "VENDOR"
           ORGANIZATION IS INDEXED
           RECORD KEY IS VENDOR-NUMBER
           ACCESS MODE IS DYNAMIC.

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 

           COPY "SLVND01.CBL".

       DATA DIVISION. 
       FILE SECTION. 
           
           COPY "FDVND01.CBL".

           
