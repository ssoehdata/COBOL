      * Generationg test sales data 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SLSGEN01.
      *--------------------------------
      *    GENERATE SALES DATA
      *--------------------------------
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 

      *----------------------------------
      * SLSALES.CBL
      *----------------------------------
           SELECT SALES-FILE 
               ASSIGN TO "SALES"
               ORGANIZATION IS SEQUENTIAL. 

       DATA DIVISION. 
       FILE SECTION. 

      *--------------------------
      * FDSALES.CBL
      * TEMPRORARY DAILY SALES FILE 
      *----------------------------
       FD  SALES-FILE  
           LABEL RECORDS ARE STANDARD.
       01  SALES-RECORD.
           05 SALES-STORE                  PIC 9(2).
           05 SALES-DIVISION               PIC 9(2). 
           05 SALES-DEPARTMENT             PIC 9(2). 
           05 SALES-CATEGORY               PIC 9(2).
           05 SALES-AMOUNT                 PIC S9(6)V99.

       WORKING-STORAGE SECTION. 

       77  THE-STORE                       PIC 99. 
       77  THE-DIVISION                    PIC 99. 
       77  THE-DEPARTMENT                  PIC 99. 
       77  THE-CATEGORY                    PIC 99. 

       77  THE-AMOUNT                      PIC S9(6)V99. 

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
           OPEN OUTPUT SALES-FILE. 

       CLOSING-PROCEDURE.
           CLOSE SALES-FILE. 

       MAIN-PROCESS.
           MOVE ZEROES TO THE-AMOUNT.
           PERFORM GENERATE-STORE-SALES 
               VARYING THE-STORE FROM 1 BY 1 
                   UNTIL THE-STORE > 6. 

       GENERATE-STORE-SALES.
           PERFORM GENERATE-CATEGORY-SALES 
               VARYING THE-CATEGORY FROM 1 BY 1 
                   UNTIL THE-CATEGORY > 12. 
       
       GENERATE-CATEGORY-SALES.
           ADD 237.57 TO THE-AMOUNT. 
           IF THE-AMOUNT > 800 
               SUBTRACT 900 FROM THE-AMOUNT. 

           MOVE THE-AMOUNT TO SALES-AMOUNT.
           MOVE THE-STORE TO SALES-STORE. 
           MOVE THE-CATEGORY TO SALES-CATEGORY.

           PERFORM GENERATE-THE-DEPARTMENT. 
           PERFORM GENERATE-THE-DIVISION. 

           WRITE SALES-RECORD. 
          
       GENERATE-THE-DEPARTMENT.
           ADD 1 TO THE-CATEGORY.
           DIVIDE THE-CATEGORY BY 2 
               GIVING THE-DEPARTMENT.
           MOVE THE-DEPARTMENT TO SALES-DEPARTMENT. 
           SUBTRACT 1 FROM THE-CATEGORY.

       GENERATE-THE-DIVISION.
           ADD 1 TO THE-DEPARTMENT 
               DIVIDE THE-DEPARTMENT BY 2 
                   GIVING THE-DIVISION.
           MOVE THE-DIVISION TO SALES-DIVISION. 
