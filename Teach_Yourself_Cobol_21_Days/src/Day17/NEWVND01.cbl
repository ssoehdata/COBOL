      * Creating the new alternate indexed file. 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. NEWVND01.
      *-----------------------------------------------
      *Create new Vendor File with Alt key from old. 
      *----------------------------------------------- 
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 

           COPY "SL0VND01.CBL".

           COPY "SLVND02.CBL".
       DATA DIVISION. 
       FILE SECTION. 

           COPY "FDOVND01.CBL".
          
           copy "FDVND04.CBL".

       WORKING-STORAGE SECTION. 

       77  OLD-VENDOR-FILE-AT-END          PIC X VALUE "N".

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 
           PERFORM OPENING-PROCEDURE. 
           PERFORM MAIN-PROCESS. 
           PERFORM CLOSING-PROCEDURE. 

       PROGRAM-DONE. 
           STOP RUN. 

       OPENING-PROCEDURE.
           OPEN OUTPUT VENDOR-FILE.
           OPEN I-O  OLD-VENDOR-FILE. 

       CLOSING-PROCEDURE.
           CLOSE VENDOR-FILE.
           CLOSE OLD-VENDOR-FILE.

       MAIN-PROCESS.
           PERFORM READ-NEXT-OLD-VENDOR-RECORD.
           PERFORM PROCESS-ONE-RECORD 
               UNTIL OLD-VENDOR-FILE-AT-END = "Y".

       READ-NEXT-OLD-VENDOR-RECORD.
           MOVE "N" TO OLD-VENDOR-FILE-AT-END. 
           READ OLD-VENDOR-FILE NEXT RECORD
               AT END 
               MOVE "Y" TO OLD-VENDOR-FILE-AT-END. 

       PROCESS-ONE-RECORD. 
           MOVE OLD-VENDOR-RECORD TO VENDOR-RECORD. 
           PERFORM WRITE-VENDOR-RECORD. 

           PERFORM READ-NEXT-OLD-VENDOR-RECORD. 

       WRITE-VENDOR-RECORD.
           WRITE VENDOR-RECORD 
               INVALID KEY 
               DISPLAY "ERROR WRITING VENDOR RECORD".
               
               





        
         
              
