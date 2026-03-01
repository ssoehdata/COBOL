      * Addiunt the state name to the report 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. VNDRPT02.
      *------------------------------------
      *    Report on the Vendor File.
      *------------------------------------ 
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           
           COPY "SLVND01.CBL".

           COPY "SLSTATE.CBL".

           SELECT PRINTER-FILE 
               ASSIGN TO PRINTER 
               ORGANIZATION IS LINE SEQUENTIAL. 

       DATA DIVISION. 
       FILE SECTION. 

           COPY "FDVND02.CBL".

           COPY "FDSTATE.CBL".

       FD  PRINTER-FILE 
           LABEL RECORDS ARE OMITTED. 
       01  PRINTER-RECORD                      PIC X(80).

       WORKING-STORAGE SECTION. 

       01  DETAIL-LINE. 
           05 PRINT-NUMBER                     PIC 9(5).
           05 FILLER                           PIC X      VALUE SPACE. 
           05 PRINT-NAME                       PIC X(30).
           05 FILLER                           PIC X(30)  VALUE SPACE.
           05 PRINT-CONTACT                    PIC X(30). 

       01  CITY-STATE-LINE.
           05 FILLER                           PIC X(6)   VALUE SPACE. 
           05 PRINT-CITY                       PIC X(20).
           05 FILLER                           PIC X      VALUE SPACE. 
           05 PRINT-STATE                      PIC X(2). 
           05 FILLER                           PIC X      VALUE SPACE. 
           05 PRINT-STATE-NAME                 PIC X(20).
           05 FILLER                           PIC X(1)   VALUE SPACE. 
           05 PRINT-ZIP                        PIC X(10).

       01  COLUMN-LINE. 
           05 FILLER                PIC X(2)  VALUE  "NO".
           05 FILLER                PIC X(4)  VALUE SPACE. 
           05 FILLER                PIC X(12) VALUE "NAME-ADDRESS".
           05 FILLER                PIC X(25) VALUE SPACE.
           05 FILLER                PIC X(17) VALUE "CONTACT-PHONE-ZIP".
       
       01  TITLE-LINE.
           05 FILLER                PIC X(25) VALUE SPACE.
           05 FILLER                PIC X(11)           
              VALUE "VENDOR LIST".
           05 FILLER                PIC X(19) VALUE SPACE. 
           05 FILLER                PIC X(5)  VALUE "PAGE:".
           05 FILLER                PIC X(1)  VALUE SPACE. 
           05 PRINT-PAGE-NUMBER     PIC ZZZZ9.

       77  FILE-AT-END              PIC X. 
       77  STATE-RECORD-FOUND       PIC X     VALUE "N".
       77  LINE-COUNT               PIC 999   VALUE ZERO.
       77  PAGE-NUMBER              PIC 99999 VALUE ZERO. 
       77  MAXIMUM-LINES            PIC 999   VALUE 55. 

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN.

           PERFORM OPENING-PROCEDURE.
           MOVE ZEROES  TO LINE-COUNT 
                           PAGE-NUMBER. 

           PERFORM START-NEW-PAGE. 

           MOVE "N" TO FILE-AT-END.
           PERFORM READ-NEXT-RECORD. 
           IF FILE-AT-END = "Y"
               MOVE "NO RECORDS FOUND" TO PRINTER-RECORD 
               PERFORM WRITE-TO-PRINTER 
           ELSE 
               PERFORM PRINT-VENDOR-FIELDS 
                   UNTIL FILE-AT-END = "Y".

           PERFORM CLOSING-PROCEDURE. 

       PROGRAM-DONE. 
           STOP RUN. 

       OPENING-PROCEDURE. 
           OPEN I-O VENDOR-FILE. 
           OPEN I-O STATE-FILE. 
           OPEN OUTPUT PRINTER-FILE. 

       CLOSING-PROCEDURE. 
           CLOSE VENDOR-FILE. 
           CLOSE STATE-FILE. 
           PERFORM END-LAST-PAGE. 
           CLOSE PRINTER-FILE. 

       PRINT-VENDOR-FIELDS. 
           IF LINE-COUNT > MAXIMUM-LINES 
               PERFORM START-NEXT-PAGE. 
           PERFORM PRINT-THE-RECORD. 
           PERFORM READ-NEXT-RECORD. 

       PRINT-THE-RECORD. 
           PERFORM PRINT-LINE-1.
           PERFORM PRINT-LINE-2. 
           PERFORM PRINT-LINE-3. 
           PERFORM PRINT-LINE-4. 
           PERFORM LINE-FEED. 
       
       PRINT-LINE-1. 
           MOVE SPACE TO DETAIL-LINE. 
           MOVE VENDOR-NUMBER TO PRINT-NUMBER. 
           MOVE VENDOR-NAME TO PRINT-NAME. 
           MOVE VENDOR-CONTACT TO PRINT-CONTACT. 
           MOVE DETAIL-LINE TO PRINTER-RECORD. 
           PERFORM WRITE-TO-PRINTER. 

       PRINT-LINE-2. 
           MOVE SPACE TO DETAIL-LINE. 
           MOVE VENDOR-ADDRESS-1 TO PRINT-NAME. 
           MOVE VENDOR-PHONE TO PRINT-CONTACT. 
           MOVE DETAIL-LINE TO PRINTER-RECORD. 
           PERFORM WRITE-TO-PRINTER. 

       PRINT-LINE-3. 
           MOVE SPACE TO DETAIL-LINE.
           MOVE VENDOR-ADDRESS-2 TO PRINT-NAME. 
           IF VENDOR-ADDRESS-2 NOT = SPACE 
               MOVE DETAIL-LINE TO PRINTER-RECORD 
               PERFORM WRITE-TO-PRINTER. 

       PRINT-LINE-4.
           MOVE SPACE TO CITY-STATE-LINE.
           MOVE VENDOR-CITY TO PRINT-CITY. 
           MOVE VENDOR-STATE TO PRINT-STATE. 
           MOVE VENDOR-STATE TO STATE-CODE. 
           PERFORM READ-STATE-RECORD. 
           IF STATE-RECORD-FOUND = "N"
               MOVE "***Not Found***" TO STATE-NAME. 
           MOVE STATE-NAME TO PRINT-STATE-NAME. 

           MOVE VENDOR-ZIP TO PRINT-ZIP. 
           MOVE CITY-STATE-LINE TO PRINTER-RECORD. 
           PERFORM WRITE-TO-PRINTER. 

       READ-NEXT-RECORD. 
           READ VENDOR-FILE NEXT RECORD 
               AT END MOVE "Y" TO FILE-AT-END. 
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
           PERFORM LINE-FEED.

       END-LAST-PAGE. 
           PERFORM FORM-FEED. 
           MOVE ZERO TO LINE-COUNT. 

       FORM-FEED.
           MOVE SPACE TO PRINTER-RECORD. 
           WRITE PRINTER-RECORD BEFORE ADVANCING  PAGE. 

       READ-STATE-RECORD. 
           MOVE "Y" TO STATE-RECORD-FOUND. 
           READ STATE-FILE RECORD 
               INVALID KEY 
               MOVE "N" TO STATE-RECORD-FOUND. 
               
                      