      * Simple Report Program 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. PHNPRT01. 
      ***********************************************************
      * This program prints the contents of the phone file.
      *********************************************************** 
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT OPTIONAL PHONE-FILE
      * or SELECT PHONE-FILE 
           ASSIGN TO "phone.dat"
      * or ASSIGN TO "phone"
           ORGANIZATION IS SEQUENTIAL.

       SELECT PRINTER-FILE 
           ASSIGN TO PRINTER 
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  PHONE-FILE
           LABEL RECORDS ARE STANDARD.
       01  PHONE-RECORD.
           05  PHONE-LAST-NAME             PIC X(20).
           05  PHONE-FIRST-NAME            PIC X(20).
           05  PHONE-NUMBER                PIC X(15).
           05  PHONE-EXTENSION             PIC X(5). 

       FD  PRINTER-FILE
           LABEL RECORDS ARE OMITTED. 
       01  PRINTER-RECORD                  PIC X(80).   

       WORKING-STORAGE SECTION. 
      * Structure for PRINTING
       01  FIELDS-TO-PRINT.
           05  PROMPT-1                    PIC X(4) VALUE "Lst:".
           05  PRINT-LAST-NAME             PIC X(20).
           05  PROMPT-2                    PIC X(4) VALUE  "1st:".
           05  PRINT-FIRST-NAME            PIC X(20). 
           05  PRINT-3                     PIC X(3) VALUE  "NO:".
           05  PRINT-NUMBER                PIC X(15).
           05  PRINT-4                     PIC X(4)    VALUE "Xtn:".
           05  PRINT-EXTENSION             PIC X(5).
        
       01  END-OF-FILE                     PIC X. 

       01  PRINT-LINES                     PIC 99. 

       PROCEDURE DIVISION. 
       MAIN-LOGIC SECTION. 
       PROGRAM-BEGIN. 

           PERFORM OPENING-PROCEDURE. 
           MOVE ZEROES TO PRINT-LINES. 
           MOVE "N" TO END-OF-FILE. 
           PERFORM READ-NEXT-RECORD. 
           PERFORM PRINT-RECORDS
               UNTIL END-OF-FILE = "Y".
           PERFORM CLOSING-PROCEDURE. 

       PROGRAM-DONE.
           STOP RUN. 

       OPENING-PROCEDURE. 
           OPEN INPUT PHONE-FILE.
           OPEN OUTPUT PRINTER-FILE. 

       CLOSING-PROCEDURE.
           CLOSE PHONE-FILE. 
           MOVE SPACE TO PRINTER-RECORD. 
           WRITE PRINTER-RECORD BEFORE ADVANCING PAGE. 
           CLOSE PRINTER-FILE. 
       
       PRINT-RECORDS.
           PERFORM PRINT-FIELDS.
           PERFORM READ-NEXT-RECORD. 
       PRINT-FIELDS. 
           IF PRINT-LINES = 55 
               PERFORM NEW-PAGE. 
           MOVE PHONE-LAST-NAME TO PRINT-LAST-NAME.
           MOVE PHONE-FIRST-NAME TO PRINT-FIRST-NAME.
           MOVE PHONE-NUMBER TO PRINT-EXTENSION.
           MOVE FIELDS-TO-PRINT TO PRINTER-RECORD.
           WRITE PRINTER-RECORD BEFORE ADVANCING 1. 

           ADD 1 TO PRINT-LINES. 
       
       READ-NEXT-RECORD. 
           READ PHONE-FILE NEXT RECORD    
               AT END 
               MOVE "Y" TO END-OF-FILE.

       NEW-PAGE.
           MOVE SPACE TO PRINTER-RECORD. 
           WRITE PRINTER-RECORD BEFORE ADVANCING PAGE. 
           MOVE ZEROES TO PRINT-LINES. 
           



       





       
