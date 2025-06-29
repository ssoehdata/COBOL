      * b2.6
      * Using Internal Tables
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SLSRPT03.
      *--------------------------------
      *       Print test sales data
      *--------------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      
      *--------------------------------
      * SLSALES.CBL
      *--------------------------------
                 SELECT SALES-FILE
           ASSIGN TO "SALES"
           ORGANIZATION IS SEQUENTIAL.
           SELECT WORK-FILE
           ASSIGN TO "WORK"
           ORGANIZATION IS SEQUENTIAL.


       SELECT SORT-FILE
       ASSIGN TO "SORT".
       SELECT PRINTER-FILE
       ASSIGN TO PRINTER
       ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
           FILE SECTION.

      *--------------------------------
      * FDSALES.CBL
      * Temporary daily sales file.
      *--------------------------------
       FD SALES-FILE

           LABEL RECORDS ARE STANDARD.
       01 SALES-RECORD.

           05 SALES-STORE                  PIC 9(2).  
           05 SALES-DIVISION               PIC 9(2).
           05 SALES-DEPARTMENT             PIC 9(2).
           05 SALES-CATEGORY               PIC 9(2).
           05 SALES-AMOUNT                 PIC S9(6)V99.

       FD  WORK-FILE
           LABEL RECORDS ARE STANDARD.
       01  WORK-RECORD.
           05 WORK-STORE             PIC 9(2).
           05 WORK-DIVISION          PIC 9(2). 
           05 WORK-DEPARTMENT        PIC 9(2).         
           05 WORK-CATEGORY          PIC 9(2).  
           05 WORK-AMOUNT            PIC S9(6)V99.

       SD SORT-FILE

           LABEL RECORDS ARE STANDARD.
       01 SORT-RECORD.
           05 SORT-STORE               PIC 9(2).           
           05 SORT-DIVISION            PIC 9(2). 
           05 SORT-DEPARTMENT          PIC 9(2).
           05 SORT-CATEGORY            PIC 9(2).
           05 SORT-AMOUNT              PIC S9(6)V99.

       FD PRINTER-FILE
           LABEL RECORDS ARE OMITTED.
       01  PRINTER-RECORD  PIC X(80).

       WORKING-STORAGE SECTION.

       01 THE-DIVISIONS. 
           05 FILLER  PIC 99 VALUE 01.
           05 FILLER            PIC X(15) VALUE "ATHLETICS".
           05 FILLER            PIC 99 VALUE 02.
           05 FILLER            PIC X(15) VALUE "SPORTING GOODS".
           05 FILLER            PIC 99 VALUE 03.
           05 FILLER            PIC X(15) VALUE "CAMPING".

       01 FILLER REDEFINES THE-DIVISIONS.
           05 DIVISION-TABLE OCCURS 3 TIMES       
              INDEXED BY DIVISION-INDEX.
              10 DIVISION-NUMBER         PIC 99.   
              10 DIVISION-NAME         PIC X(15).

       01 THE-DEPARTMENTS.
           05 FILLER            PIC 99 VALUE 01.
           05 FILLER            PIC X(15) VALUE "EXERCISE".        
           05 FILLER            PIC 99 VALUE 02.
           05 FILLER            PIC X(15) VALUE "MISCELLANEOUS".
           05 FILLER            PIC 99 VALUE 03.
           05 FILLER            PIC X(15) VALUE "SPORT CLOTHES".
           05 FILLER            PIC 99 VALUE 04.
           05 FILLER            PIC X(15) VALUE "EQUIPMENT".
           05 FILLER            PIC 99 VALUE 05.
           05 FILLER            PIC X(15) VALUE "CAMP EQUIPMENT".
           05 FILLER            PIC 99 VALUE 06.
           05 FILLER            PIC X(15) VALUE "CAMPING CLOTHES".
       01  FILLER REDEFINES THE-DEPARTMENTS.

           05 DEPARTMENT-TABLE OCCURS 6 TIMES
              INDEXED BY DEPARTMENT-INDEX.
               10 DEPARTMENT-NUMBER           PIC 99.

               10 DEPARTMENT-NAME           PIC X(15).

       01 THE-CATEGORIES.
           05 FILLER           PIC 99 VALUE 01.
           05 FILLER           PIC X(15) VALUE "WEIGHTS".
           05 FILLER           PIC 99 VALUE 02.
           05 FILLER           PIC X(15) VALUE "MACHINES".
           05 FILLER           PIC 99 VALUE 03.
           05 FILLER           PIC X(15) VALUE "SUN GLASSES".
           05 FILLER           PIC 99 VALUE 04.
           05 FILLER           PIC X(15) VALUE "VITAMINS".
           05 FILLER           PIC 99 VALUE 05.
           05 FILLER           PIC X(15) VALUE "MEN'S CLOTHES".
           05 FILLER           PIC 99 VALUE 06.
           05 FILLER           PIC X(15) VALUE "WOMEN'S CLOTHES".
           05 FILLER           PIC 99 VALUE 07.
           05 FILLER           PIC X(15) VALUE "TENNIS".
           05 FILLER           PIC 99 VALUE 08.
           05 FILLER           PIC X(15) VALUE "SOCCER".
           05 FILLER           PIC 99 VALUE 09.
           05 FILLER           PIC X(15) VALUE "TENTS".
           05 FILLER           PIC 99 VALUE 10.
           05 FILLER           PIC X(15) VALUE "SLEEPING BAGS".
           05 FILLER           PIC 99 VALUE 11.
           05 FILLER           PIC X(15) VALUE "CLOTHING".
           05 FILLER           PIC 99 VALUE 12.
           05 FILLER           PIC X(15) VALUE "HIKING BOOTS".
       01   FILLER REDEFINES THE-CATEGORIES.

           05 CATEGORY-TABLE OCCURS 12 TIMES
           INDEXED BY CATEGORY-INDEX.
           10 CATEGORY-NUMBER            PIC 99.
           10 CATEGORY-NAME           PIC X(15).
       77  OK-TO-PROCESS            PIC X.

           COPY "WSCASE01.CBL".

       01  LEGEND-LINE.
           05 FILLER           PIC X(6) VALUE "STORE:".
           05 FILLER           PIC X(1) VALUE SPACE.
           05 PRINT-STORE            PIC Z9.
       01  DETAIL-LINE.

           05 FILLER            PIC X(3) VALUE SPACE.
           05 PRINT-DIVISION            PIC Z9.
           05 FILLER            PIC X(4) VALUE SPACE.
           05 FILLER            PIC X(3) VALUE SPACE.
           05 PRINT-DEPARTMENT            PIC Z9.
           05 FILLER            PIC X(6) VALUE SPACE.
           05 FILLER            PIC X(3) VALUE SPACE.
           05 PRINT-CATEGORY            PIC Z9.
           05 FILLER            PIC X(4) VALUE SPACE.
           05 PRINT-CATEGORY-NAME            PIC X(15).
           05 FILLER            PIC X(1) VALUE SPACE.
           05 PRINT-AMOUNT            PIC ZZZ,ZZ9.99-.

       01  COLUMN-LINE.

           05 FILLER            PIC X(8)  VALUE "DIVISION".
           05 FILLER            PIC X(1)  VALUE SPACE.
           05 FILLER            PIC X(10) VALUE "DEPARTMENT".
           05 FILLER            PIC X(1)  VALUE SPACE.
           05 FILLER            PIC X(8)  VALUE "CATEGORY".
           05 FILLER            PIC X(1)  VALUE SPACE.
           05 FILLER            PIC X(15) VALUE SPACE.
           05 FILLER            PIC X(5)  VALUE SPACE.
           05 FILLER            PIC X(6)  VALUE "AMOUNT".

       01  TITLE-LINE.
           05 FILLER                   PIC X(30)  VALUE SPACE.
           05 FILLER                   PIC X(12)  VALUE 
           "SALES REPORT".    
           05 FILLER                   PIC X(16)  VALUE SPACE.
           05 FILLER                   PIC X(5)   VALUE "PAGE:".
           05 FILLER                   PIC X(1)   VALUE SPACE.
           05 PRINT-PAGE-NUMBER        PIC ZZZ9.
       01  TOTAL-LINE.    
           05 FILLER                   PIC X(11) VALUE SPACE.
           05 TOTAL-TYPE               PIC X(8).
           05 FILLER                   PIC X(1) VALUE SPACE.
           05 TOTAL-NUMBER             PIC Z9.
           05 FILLER                   PIC X(1) VALUE SPACE.
           05 TOTAL-NAME               PIC X(15) VALUE SPACE.
           05 FILLER                   PIC X(1) VALUE SPACE.
           05 TOTAL-LITERAL            PIC X(5) VALUE "TOTAL".
           05 FILLER                   PIC X(1) VALUE SPACE.
           05 PRINT-TOTAL              PIC ZZZ,ZZ9.99-.

       77  GRAND-TOTAL-LITERAL         PIC X(8) VALUE  "    GRAND".
       77  STORE-TOTAL-LITERAL         PIC X(8) VALUE  "    STORE".
       77  DIVISION-TOTAL-LITERAL      PIC X(8) VALUE  "DIVISION".
       77  DEPARTMENT-TOTAL-LITERAL    PIC X(8) VALUE "     DEPT".

       77  WORK-FILE-AT-END            PIC X.

       77  LINE-COUNT                  PIC 999 VALUE ZERO.
       77  PAGE-NUMBER                 PIC 9999 VALUE ZERO.
       77  MAXIMUM-LINES               PIC 999 VALUE 55.
   
       77  RECORD-COUNT                PIC 9999 VALUE ZEROES.

      * Control break current values for store, division
      * department.
       77 CURRENT-STORE                PIC 99.
       77 CURRENT-DIVISION             PIC 99.
       77 CURRENT-DEPARTMENT           PIC 99.
        
      * Control break accumulators
      * GRAND TOTAL is the level 1 accumulator for the whole file
      * STORE TOTAL is the level 2 accumulator
      * DIVISION TOTAL is the level 3 accumulator
      * DEPARTMENT TOTAL is the level 4 accumulator.
       77 GRAND-TOTAL                  PIC S9(6)V99.
       77 STORE-TOTAL                  PIC S9(6)V99.
       77 DIVISION-TOTAL               PIC S9(6)V99.
       77 DEPARTMENT-TOTAL             PIC S9(6)V99.

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

           OPEN OUTPUT PRINTER-FILE.

       MAIN-PROCESS.
           PERFORM GET-OK-TO-PROCESS. 
           PERFORM PROCESS-THE-FILE
           UNTIL OK-TO-PROCESS = "N".

       CLOSING-PROCEDURE.

           CLOSE PRINTER-FILE.
           GET-OK-TO-PROCESS.          
           PERFORM ACCEPT-OK-TO-PROCESS.          
           PERFORM RE-ACCEPT-OK-TO-PROCESS          
           UNTIL OK-TO-PROCESS = "Y" OR "N".
          
           ACCEPT-OK-TO-PROCESS.          
           DISPLAY "PRINT SALES REPORT (Y/N)?".          
           ACCEPT OK-TO-PROCESS.
          
           INSPECT OK-TO-PROCESS
           CONVERTING LOWER-ALPHA
           TO
           UPPER-ALPHA.
          
       RE-ACCEPT-OK-TO-PROCESS.
           DISPLAY "YOU MUST ENTER YES OR NO".
           PERFORM ACCEPT-OK-TO-PROCESS.

       PROCESS-THE-FILE.
           PERFORM START-THE-FILE.
           PERFORM PRINT-ONE-REPORT.
           PERFORM END-THE-FILE.

      *PERFORM GET-OK-TO-PROCESS.

           MOVE "N" TO OK-TO-PROCESS.

       START-THE-FILE.

           PERFORM SORT-DATA-FILE.
           OPEN INPUT WORK-FILE.

       END-THE-FILE.
           CLOSE WORK-FILE.

       SORT-DATA-FILE.

           SORT SORT-FILE
           ON ASCENDING KEY SORT-STORE
           ASCENDING KEY SORT-DIVISION
           ASCENDING KEY SORT-DEPARTMENT
           USING SALES-FILE
           GIVING WORK-FILE.

      * LEVEL 1 CONTROL BREAK
       PRINT-ONE-REPORT.
           PERFORM START-ONE-REPORT.
           PERFORM PROCESS-ALL-STORES
           UNTIL WORK-FILE-AT-END = "Y".
           PERFORM END-ONE-REPORT.

       START-ONE-REPORT.
           PERFORM READ-FIRST-VALID-WORK.
           MOVE ZEROES TO GRAND-TOTAL.
           PERFORM START-NEW-REPORT.

       START-NEW-REPORT.
           MOVE SPACE TO DETAIL-LINE.
           MOVE ZEROES TO LINE-COUNT PAGE-NUMBER.

       END-ONE-REPORT.

           IF RECORD-COUNT = ZEROES
           MOVE "NO RECORDS FOUND" TO PRINTER-RECORD
           PERFORM WRITE-TO-PRINTER
           ELSE
           PERFORM PRINT-GRAND-TOTAL.
           PERFORM END-LAST-PAGE.

       PRINT-GRAND-TOTAL.

           MOVE SPACE TO TOTAL-LINE.
           MOVE GRAND-TOTAL TO PRINT-TOTAL.
           MOVE GRAND-TOTAL-LITERAL TO TOTAL-TYPE.
           MOVE "TOTAL" TO TOTAL-LITERAL.
           MOVE TOTAL-LINE TO PRINTER-RECORD.
           PERFORM WRITE-TO-PRINTER.
           PERFORM LINE-FEED 2 TIMES.
           MOVE SPACE TO DETAIL-LINE.

      *LEVEL 2 CONTROL BREAK
       PROCESS-ALL-STORES.      
           PERFORM START-ONE-STORE.
           PERFORM PROCESS-ALL-DIVISIONS
           UNTIL WORK-FILE-AT-END = "Y"
           OR WORK-STORE NOT = CURRENT-STORE.
           PERFORM END-ONE-STORE.

       START-ONE-STORE.
           MOVE WORK-STORE TO CURRENT-STORE.
           MOVE ZEROES TO STORE-TOTAL.
           MOVE WORK-STORE TO PRINT-STORE.
           PERFORM START-NEXT-PAGE.

       END-ONE-STORE.
           PERFORM PRINT-STORE-TOTAL.
           ADD STORE-TOTAL TO GRAND-TOTAL.

       PRINT-STORE-TOTAL.
           MOVE SPACE TO TOTAL-LINE.
           MOVE STORE-TOTAL TO PRINT-TOTAL.
           MOVE CURRENT-STORE TO TOTAL-NUMBER.
           MOVE "TOTAL" TO TOTAL-LITERAL.
           MOVE TOTAL-LINE TO PRINTER-RECORD.
           PERFORM WRITE-TO-PRINTER.
           PERFORM LINE-FEED.
           MOVE SPACE TO DETAIL-LINE.

      * LEVEL 3 CONTROL BREAK
       PROCESS-ALL-DIVISIONS.

           PERFORM START-ONE-DIVISION.
           PERFORM PROCESS-ALL-DEPARTMENTS
           UNTIL WORK-FILE-AT-END = "Y"
           OR WORK-STORE NOT = CURRENT-STORE
           OR WORK-DIVISION NOT = CURRENT-DIVISION.
           PERFORM END-ONE-DIVISION.

       START-ONE-DIVISION.
           MOVE WORK-DIVISION TO CURRENT-DIVISION.
           MOVE ZEROES TO DIVISION-TOTAL.
           MOVE WORK-DIVISION TO PRINT-DIVISION.

       END-ONE-DIVISION.
           PERFORM PRINT-DIVISION-TOTAL.
           ADD DIVISION-TOTAL TO STORE-TOTAL.

       PRINT-DIVISION-TOTAL.

           MOVE SPACE TO TOTAL-LINE.
           MOVE DIVISION-TOTAL TO PRINT-TOTAL.
           MOVE CURRENT-DIVISION TO TOTAL-NUMBER.
           MOVE DIVISION-TOTAL-LITERAL TO TOTAL-TYPE.
           MOVE "TOTAL" TO TOTAL-LITERAL.
           PERFORM LOAD-DIVISION-NAME.
           MOVE TOTAL-LINE TO PRINTER-RECORD.
           PERFORM WRITE-TO-PRINTER.
           PERFORM LINE-FEED.
           MOVE SPACE TO DETAIL-LINE.

       LOAD-DIVISION-NAME.

           SET DIVISION-INDEX TO 1.
           SEARCH DIVISION-TABLE
           AT END
           MOVE "NOT FOUND" TO TOTAL-NAME
           WHEN
           DIVISION-NUMBER(DIVISION-INDEX) =
           CURRENT-DIVISION
           MOVE DIVISION-NAME(DIVISION-INDEX) TO
           TOTAL-NAME.

      * LEVEL 4 CONTROL BREAK
       PROCESS-ALL-DEPARTMENTS.
           PERFORM START-ONE-DEPARTMENT.
           PERFORM PROCESS-ALL-CATEGORIES
           UNTIL WORK-FILE-AT-END = "Y"
           OR WORK-STORE NOT = CURRENT-STORE
           OR WORK-DIVISION NOT = CURRENT-DIVISION
           OR WORK-DEPARTMENT NOT = CURRENT-DEPARTMENT.
           PERFORM END-ONE-DEPARTMENT.

       START-ONE-DEPARTMENT.

           MOVE WORK-DEPARTMENT TO CURRENT-DEPARTMENT.
           MOVE ZEROES TO DEPARTMENT-TOTAL.
           MOVE WORK-DEPARTMENT TO PRINT-DEPARTMENT.

       END-ONE-DEPARTMENT.
           PERFORM PRINT-DEPARTMENT-TOTAL.
           ADD DEPARTMENT-TOTAL TO DIVISION-TOTAL.

       PRINT-DEPARTMENT-TOTAL.

           MOVE SPACE TO TOTAL-LINE.
           MOVE DEPARTMENT-TOTAL TO PRINT-TOTAL.
           MOVE CURRENT-DEPARTMENT TO TOTAL-NUMBER.
           MOVE DEPARTMENT-TOTAL-LITERAL TO TOTAL-TYPE.
           MOVE "TOTAL" TO TOTAL-LITERAL.
           PERFORM LOAD-DEPARTMENT-NAME.
           MOVE TOTAL-LINE TO PRINTER-RECORD.
           PERFORM WRITE-TO-PRINTER.
           PERFORM LINE-FEED.
           MOVE SPACE TO DETAIL-LINE.

       LOAD-DEPARTMENT-NAME.
           SET DEPARTMENT-INDEX TO 1.
           SEARCH DEPARTMENT-TABLE
           AT END
           MOVE "NOT FOUND" TO TOTAL-NAME
           WHEN
           DEPARTMENT-NUMBER(DEPARTMENT-INDEX) =
           CURRENT-DEPARTMENT
           MOVE DEPARTMENT-NAME(DEPARTMENT-INDEX) TO
           TOTAL-NAME.

      * PROCESS ONE RECORD LEVEL
       PROCESS-ALL-CATEGORIES.
           PERFORM PROCESS-THIS-CATEGORY.
           ADD WORK-AMOUNT TO DEPARTMENT-TOTAL.
           ADD 1 TO RECORD-COUNT.
           PERFORM READ-NEXT-VALID-WORK.

       PROCESS-THIS-CATEGORY.
           IF LINE-COUNT > MAXIMUM-LINES
           PERFORM START-NEXT-PAGE.
           PERFORM PRINT-THE-RECORD.
       PRINT-THE-RECORD.
           MOVE WORK-CATEGORY TO PRINT-CATEGORY.
           PERFORM LOAD-CATEGORY-NAME.
           MOVE WORK-AMOUNT TO PRINT-AMOUNT.
           MOVE DETAIL-LINE TO PRINTER-RECORD.
           PERFORM WRITE-TO-PRINTER.
           MOVE SPACE TO DETAIL-LINE.
       LOAD-CATEGORY-NAME.

           SET CATEGORY-INDEX TO 1.
           SEARCH CATEGORY-TABLE
           AT END
           MOVE "NOT FOUND" TO TOTAL-NAME
           WHEN
           CATEGORY-NUMBER(CATEGORY-INDEX) =
           WORK-CATEGORY
           MOVE CATEGORY-NAME(CATEGORY-INDEX) TO
           PRINT-CATEGORY-NAME.

      * PRINTING ROUTINES
           WRITE-TO-PRINTER.
           WRITE PRINTER-RECORD BEFORE ADVANCING 1.
           ADD 1 TO LINE-COUNT.

       LINE-FEED.

           MOVE SPACE TO PRINTER-RECORD.
           PERFORM WRITE-TO-PRINTER.

       START-NEXT-PAGE.
           PERFORM END-LAST-PAGE.
           PERFORM START-NEW-PAGE.

       START-NEW-PAGE.

           ADD 1 TO PAGE-NUMBER.
           MOVE PAGE-NUMBER TO PRINT-PAGE-NUMBER.
           MOVE TITLE-LINE TO PRINTER-RECORD.
           PERFORM WRITE-TO-PRINTER.
           PERFORM LINE-FEED.
           MOVE LEGEND-LINE TO PRINTER-RECORD.
           PERFORM WRITE-TO-PRINTER.
           PERFORM LINE-FEED.
           MOVE COLUMN-LINE TO PRINTER-RECORD.
           PERFORM WRITE-TO-PRINTER.
           PERFORM LINE-FEED.

       END-LAST-PAGE.

           IF PAGE-NUMBER > 0
           PERFORM FORM-FEED.
           MOVE ZERO TO LINE-COUNT.

       FORM-FEED.

           MOVE SPACE TO PRINTER-RECORD.
           WRITE PRINTER-RECORD BEFORE ADVANCING PAGE.
       
      *--------------------------------
      * Read first, read next routines
      *--------------------------------
        READ-FIRST-VALID-WORK.       
           PERFORM READ-NEXT-VALID-WORK.

       READ-NEXT-VALID-WORK.
           PERFORM READ-NEXT-WORK-RECORD.
       READ-NEXT-WORK-RECORD.
           MOVE "N" TO WORK-FILE-AT-END.
           READ WORK-FILE NEXT RECORD
           AT END MOVE "Y" TO WORK-FILE-AT-END.
