      * Another control break problem 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. BLBYVN02.
      *----------------------------------------------------
      * BILLS REPORT BY VENDOR
      *----------------------------------------------------
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 

           COPY "SLVOUCH.CBL".

           COPY "SLVND02.CBL".

           COPY "SLSTATE.CBL".

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

           COPY "FDVOUCH.CBL".

           COPY "FDVND04.CBL".

           COPY "FDSTATE.CBL".

       FD  WORK-FILE 
           LABEL RECORDS ARE STANDARD. 
       01  WORK-RECORD. 
           05 WORK-NUMBER          PIC 9(5). 
           05 WORK-VENDOR          PIC 9(5).
           05 WORK-INVOICE         PIC X(15). 
           05 WORK-FOR             PIC X(30).
           05 WORK-AMOUNT          PIC S9(6)V99. 
           05 WORK-DATE            PIC 9(8).
           05 WORK-DUE             PIC 9(8).
           05 WORK-DEDUCTIBLE      PIC X. 
           05 WORK-SELECTED        PIC X. 
           05 WORK-PAID-AMOUNT     PIC S9(6)V99. 
           05 WORK-PAID-DATE       PIC 9(8).
           05 WORK-CHECK-NO        PIC 9(6). 

       SD  SORT-FILE. 

       01  SORT-RECORD. 
           05 SORT-NUMBER          PIC 9(5).
           05 SORT-VENDOR          PIC 9(5). 
           05 SORT-INVOICE         PIC X(15). 
           05 SORT-FOR             PIC X(30). 
           05 SORT-AMOUNT          PIC S9(6)V99. 
           05 SORT-DATE            PIC 9(8). 
           05 SORT-DUE             PIC 9(8).
           05 SORT-DEDUCTIBLE      PIC X. 
           05 SORT-SELECTED        PIC X. 
           05 SORT-PAID-AMOUNT     PIC S9(6)V99. 
           05 SORT-PAID-DATE       PIC 9(8). 
           05 SORT-CHECK-NO        PIC 9(6). 

       FD  PRINTER-FILE 
           LABEL RECORDS ARE OMITTED. 
       01  PRINTER-RECORD          PIC X(80).

       WORKING-STORAGE SECTION. 

       77  OK-TO-PROCESS           PIC X. 

           COPY "WSCASE01.CBL".

       01  DETAIL-LINE. 
           05 PRINT-NAME           PIC X(30).
           05 FILLER               PIC X(1) VALUE SPACE. 
           05 PRINT-NUMBER         PIC ZZZZ9. 
           05 FILLER               PIC X(3) VALUE SPACE. 
           05 PRINT-DUE-DATE       PIC Z9/99/9999.
           05 FILLER               PIC X(1) VALUE SPACE. 
           05 PRINT-AMOUNT         PIC ZZZ,ZZ9.99.
           05 FILLER               PIC X(1) VALUE SPACE. 
           05 PRINT-INVOICE        PIC X(15). 

       01  VENDOR-TOTAL-LITERAL. 
           05 FILLER               PIC X(18)   VALUE SPACE. 
           05 FILLER               PIC X(12)   VALUE "VENDOR TOTAL".

       01  GRAND-TOTAL-LITERAL.      
           05 FILLER               PIC X(25)   VALUE SPACE.
           05 FILLER               PIC X(5)    VALUE "TOTAL".

       01  COLUMN-LINE.
           05 FILLER               PIC X(6)    VALUE "VENDOR".
           05 FILLER               PIC X(23)   VALUE SPACE. 
           05 FILLER               PIC X(7)    VALUE "VOUCHER". 
           05 FILLER               PIC X(5)     VALUE SPACE. 
           05 FILLER               PIC X(8)    VALUE "DUE DATE".
           05 FILLER               PIC X(1)    VALUE SPACE. 
           05 FILLER               PIC X(10)   VALUE "AMOUNT DUE".
           05 FILLER               PIC X(1)    VALUE SPACE. 
           05 FILLER               PIC X(7)    VALUE "INVOICE".

       01  TITLE-LINE. 
           05 FILLER               PIC X(25)   VALUE SPACE. 
           05 FILLER               PIC X(22) 
              VALUE "BILLS REPORT BY VENDOR".
           05 FILLER               PIC X(11)   VALUE SPACE. 
           05 FILLER               PIC X(5)    VALUE "PAGE:".
           05 FILLER               PIC X(1)    VALUE SPACE. 
           05 PRINT-PAGE-NUMBER    PIC ZZZ9. 

       77  WORK-FILE-AT-END        PIC X.
       77  VENDOR-RECORD-FOUND     PIC X.

       77  LINE-COUNT              PIC 999 VALUE ZERO.

       77  PAGE-NUMBER             PIC 9999 VALUE ZERO.
       77  MAXIMUM-LINES           PIC 999 VALUE 55. 

       77  RECORD-COUNT            PIC 9999 VALUE ZEROES. 
      
      * CONTROL BREAK CURRENT VALUE FOR VENDOR 
       77  CURRENT-VENDOR          PIC 9(5). 

      * CONTROL BREAK ACCUMULATORS 
      * GRAND TOTAL IS LEVEL 1 ACCUMULATOR FOR THE WHOLE FILE 
      * VENDOR TOTAL IS THE LEVE 2 ACCUMULATOR 
       77  GRAND-TOTAL             PIC S9(6)V99. 
       77  VENDOR-TOTAL            PIC S9(6)V99. 

           COPY 'WSDATE01.CBL'.

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
           OPEN I-O VENDOR-FILE.
           
           OPEN OUTPUT PRINTER-FILE. 

       MAIN-PROCESS.
           PERFORM GET-OK-TO-PROCESS. 
           PERFORM PROCESS-THE-FILE
               UNTIL OK-TO-PROCESS = "N".

       CLOSING-PROCEDURE.
           CLOSE VENDOR-FILE.
           CLOSE PRINTER-FILE.

       GET-OK-TO-PROCESS.
           PERFORM ACCEPT-OK-TO-PROCESS.
           PERFORM RE-ACCEPT-OK-TO-PROCESS
               UNTIL OK-TO-PROCESS = "Y" OR "N".

       ACCEPT-OK-TO-PROCESS.
           DISPLAY "PRINT BILLS BY VENDOR (Y/N)?".
           ACCEPT OK-TO-PROCESS.
           INSPECT OK-TO-PROCESS
               CONVERTING  LOWER-ALPHA
               TO          UPPER-ALPHA.

       RE-ACCEPT-OK-TO-PROCESS.
           DISPLAY "YOU MUST ENTER YES OR NO".
           PERFORM ACCEPT-OK-TO-PROCESS. 

       PROCESS-THE-FILE.
           PERFORM START-THE-FILE.
           PERFORM PRINT-ONE-REPORT.
           PERFORM END-THE-FILE.

      *    PERFORM GET-OK-TO-PROCESS.
           MOVE "N" TO OK-TO-PROCESS. 
       
       START-THE-FILE.
           PERFORM SORT-DATA-FILE. 
           OPEN INPUT WORK-FILE. 

       END-THE-FILE.
           CLOSE WORK-FILE.

       SORT-DATA-FILE.
           SORT SORT-FILE 
               ON ASCENDING KEY SORT-VENDOR 
                   USING VOUCHER-FILE 
                   GIVING WORK-FILE. 

      * LEVEL 1 CONTROL BREAK 
       PRINT-ONE-REPORT.
           PERFORM START-ONE-REPORT.
           PERFORM PROCESS-ALL-VENDORS 
               UNTIL WORK-FILE-AT-END = "Y".
           PERFORM END-ONE-REPORT. 

       START-ONE-REPORT. 
           PERFORM READ-FIRST-VALID-WORK. 
           MOVE ZEROES TO GRAND-TOTAL.

           PERFORM START-NEW-REPORT. 

       START-NEW-REPORT.
           MOVE SPACE TO DETAIL-LINE.
           MOVE ZEROES TO LINE-COUNT PAGE-NUMBER. 
           PERFORM START-NEW-PAGE. 

       END-ONE-REPORT.
           IF RECORD-COUNT = ZEROES 
               MOVE "NO RECORDS FOUND" TO PRINTER-RECORD 
               PERFORM WRITE-TO-PRINTER
           ELSE 
               PERFORM PRINT-GRAND-TOTAL. 
           PERFORM END-LAST-PAGE. 

       PRINT-GRAND-TOTAL.
           MOVE GRAND-TOTAL TO PRINT-AMOUNT.
           MOVE GRAND-TOTAL-LITERAL TO PRINT-NAME. 
           MOVE DETAIL-LINE TO PRINTER-RECORD.
           PERFORM WRITE-TO-PRINTER.
           PERFORM LINE-FEED 2 TIMES.
           MOVE SPACE TO DETAIL-LINE. 

      * LEVEL 2 CONTROL BREAK 
       PROCESS-ALL-VENDORS.
           PERFORM START-ONE-VENDOR.

           PERFORM PROCESS-ALL-VOUCHERS
               UNTIL WORK-FILE-AT-END = "Y"
                   OR WORK-VENDOR NOT = CURRENT-VENDOR. 

           PERFORM END-ONE-VENDOR.

       START-ONE-VENDOR.
           MOVE WORK-VENDOR TO CURRENT-VENDOR. 
           MOVE ZEROES TO VENDOR-TOTAL.

           PERFORM LOAD-VENDOR-NAME. 

       LOAD-VENDOR-NAME. 
           MOVE WORK-VENDOR TO VENDOR-NUMBER.
           PERFORM READ-VENDOR-RECORD.
           IF VENDOR-RECORD-FOUND = "Y"
               MOVE VENDOR-NAME TO PRINT-NAME 
           ELSE 
               MOVE "*VENDOR NOT ON FILE*" TO PRINT-NAME.

       END-ONE-VENDOR.
           PERFORM PRINT-VENDOR-TOTAL.
           ADD VENDOR-TOTAL TO GRAND-TOTAL. 
           
       PRINT-VENDOR-TOTAL. 
           MOVE VENDOR-TOTAL TO PRINT-AMOUNT.
           MOVE VENDOR-TOTAL-LITERAL TO PRINT-NAME.
           MOVE DETAIL-LINE TO PRINTER-RECORD. 
           PERFORM WRITE-TO-PRINTER.
           PERFORM LINE-FEED.
           MOVE SPACE TO DETAIL-LINE. 

      * PROCESS ONE RECORD LEVEL 
       PROCESS-ALL-VOUCHERS.
           PERFORM PROCESS-THIS-VOUCHER.
           ADD WORK-AMOUNT TO VENDOR-TOTAL.
           ADD 1 TO RECORD-COUNT. 
           PERFORM READ-NEXT-VALID-WORK. 

       PROCESS-THIS-VOUCHER.
           IF LINE-COUNT > MAXIMUM-LINES   
               PERFORM START-NEXT-PAGE.
           PERFORM PRINT-THE-RECORD. 

       PRINT-THE-RECORD.
           MOVE WORK-NUMBER TO PRINT-NUMBER.

           MOVE WORK-DUE TO DATE-CCYYMMDD.
           PERFORM CONVERT-TO-MMDDCCYY. 
           MOVE DATE-MMDDCCYY TO PRINT-DUE-DATE.

           MOVE WORK-AMOUNT TO PRINT-AMOUNT.
           MOVE WORK-INVOICE TO PRINT-INVOICE.

           MOVE DETAIL-LINE TO PRINTER-RECORD. 
           PERFORM WRITE-TO-PRINTER.
           MOVE SPACE TO DETAIL-LINE. 

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
           MOVE COLUMN-LINE TO PRINTER-RECORD. 
           PERFORM WRITE-TO-PRINTER.
           PERFORM LINE-FEED.

       END-LAST-PAGE.
           PERFORM FORM-FEED.
           MOVE ZERO TO LINE-COUNT.

       FORM-FEED. 
           MOVE SPACE TO PRINTER-RECORD. 
           WRITE PRINTER-RECORD BEFORE ADVANCING PAGE. 

      *-------------------------------------------
      *  READ FIRST, READ NEXT ROUTINES
      *-------------------------------------------
       READ-FIRST-VALID-WORK.
           PERFORM READ-NEXT-VALID-WORK. 

       READ-NEXT-VALID-WORK.
           PERFORM READ-NEXT-WORK-RECORD.
           PERFORM READ-NEXT-WORK-RECORD 
               UNTIL WORK-FILE-AT-END = "Y"
                   OR WORK-PAID-DATE = ZEROES.

       READ-NEXT-WORK-RECORD.
           MOVE "N" TO WORK-FILE-AT-END. 
           READ WORK-FILE NEXT RECORD 
               AT END MOVE "Y" TO  WORK-FILE-AT-END.

      *--------------------------------------------
      *    OTHER FILE I-O ROUTINES
      *--------------------------------------------
       READ-VENDOR-RECORD.
           MOVE "Y" TO VENDOR-RECORD-FOUND.
           READ VENDOR-FILE RECORD 
               INVALID KEY 
               MOVE "N" TO VENDOR-RECORD-FOUND.

      *--------------------------------------------------
      *            UTILITY ROUTINES 
      *--------------------------------------------------
           COPY "PLDATE01.CBL".


