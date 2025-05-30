      * Fixing the vendor file. 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VNDFIX01.
      *-----------------------------------------------------
      * Repairs any lowercase errors in the vendor file by 
      * converting the whole record to uppercase. 
      *------------------------------------------------------
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           
           COPY "SLVND01.CBL".

       DATA DIVISION.
       FILE SECTION.

           COPY "FDVND03.CBL".

       WORKING-STORAGE SECTION.        
       77  VENDOR-AT-END               PIC X VALUE "N".

           COPY "WSCASE01.CBL".

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM OPENING-PROCEDURE.
           PERFORM MAIN-PROCESS.
           PERFORM CLOSING-PROCEDURE.

       PROGRAM-DONE.
           STOP RUN. 

       OPENING-PROCEDURE.
           OPEN I-O VENDOR-FILE.

       CLOSING-PROCEDURE.
           CLOSE VENDOR-FILE. 

       MAIN-PROCESS.
           PERFORM READ-NEXT-VENDOR-RECORD.
           PERFORM FIX-VENDOR-RECORDS
               UNTIL VENDOR-AT-END = "Y".

       FIX-VENDOR-RECORDS. 
           INSPECT VENDOR-RECORD 
               CONVERTING LOWER-ALPHA 
               TO         UPPER-ALPHA. 
           PERFORM REWRITE-VENDOR-RECORD. 
           PERFORM READ-NEXT-VENDOR-RECORD. 

       READ-NEXT-VENDOR-RECORD.
           MOVE "N" TO VENDOR-AT-END.
           READ VENDOR-FILE NEXT RECORD
               END MOVE "Y" TO VENDOR-AT-END.

      * OR READ VENDOR-FILE NEXT RECORD WITH LOCK 
      *    AT END MOVE "Y" TO VENDOR-AT-END. 

      * OR READ VENDOR-FILE NEXT RECORD WITH HOLD 
      *    AT END MOVE "Y" TO VENDOR-AT-END. 

       REWRITE-VENDOR-RECORD.
           REWRITE VENDOR-RECORD 
               INVALID KEY 
               DISPLAY "ERROR REWRITING VENDOR RECORD".
               

       
       


       

                 