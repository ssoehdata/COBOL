      * Looking up records in a field 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. VNDINQ01.
      *-----------------------------------------------------
      * Looj up records in Vendor File. 
      *-----------------------------------------------------
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 

           COPY "SLVND01.CBL".          

       DATA DIVISION. 
       FILE SECTION. 

           COPY "FDVND02.CBL".

       WORKING-STORAGE SECTION. 

       77  RECORD-FOUND                PIC X. 
       77  VENDOR-NUMBER-FIELD         PIC Z(5). 

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           OPEN I-O VENDOR-FILE. 
           PERFORM GET-VENDOR-RECORD. 
           PERFORM INQUIRE-RECORDS   
               UNTIL VENDOR-NUMBER = ZEROES. 
           CLOSE VENDOR-FILE. 

       PROGRAM-DONE. 
           STOP RUN. 

      *----------------------------------------------
      * TO GET A VENDOR RECORD, ASK FOR VENDOR NUMBER,
      * AND THEN TRY TO READ THE RECORD. 
      *----------------------------------------------
       GET-VENDOR-RECORD.
           PERFORM INIT-VENDOR-RECORD.
           PERFORM ENTER-VENDOR-NUMBER. 
           MOVE "N" TO RECORD-FOUND. 
           PERFORM FIND-VENDOR-RECORD 
               UNTIL RECORD-FOUND = "Y" OR  
                   VENDOR-NUMBER = ZEROES.

       INIT-VENDOR-RECORD. 
           MOVE SPACE TO VENDOR-RECORD. 
           MOVE ZEROES TO VENDOR-NUMBER. 

       ENTER-VENDOR-NUMBER. 
           DISPLAY " ".
           DISPLAY "ENTER VENDOR NUMBER OF THE VENDOR".
           DISPLAY "TO DISPLAY  (1-99999)".
           DISPLAY "ENTER 0 TO STOP ENTRY".
           ACCEPT VENDOR-NUMBER-FIELD. 
      * OR ACCEPT VENDOR-NUMBER-FIELD WITH CONVERSION. 

           MOVE VENDOR-NUMBER-FIELD TO VENDOR-NUMBER. 

       FIND-VENDOR-RECORD. 
           PERFORM READ-VENDOR-RECORD. 
           IF RECORD-FOUND = "N"   
               DISPLAY "RECORD NOT FOUND"
               PERFORM ENTER-VENDOR-NUMBER. 
       READ-VENDOR-RECORD.
           MOVE "Y" TO RECORD-FOUND.
           READ VENDOR-FILE RECORD
           INVALID KEY
           MOVE "N" TO RECORD-FOUND.
       

      * OR READ VENDOR-FILE RECORD WITH LOCK 
      *    INVALID KEY 
      *        MOVE "N" TO RECORD-FOUND. 

      * OR READ VENDOR-FILE RECORD WITH HOLD 
      *    INVALID KEY 
      *         MOVE "N" TO RECORD-FOUND. 

       INQUIRE-RECORDS. 
           PERFORM DISPLAY-ALL-FIELDS. 

           PERFORM GET-VENDOR-RECORD. 

      *--------------------------------
      * DISPLAY ALL FIELDS WITH BLANK
      * LINES ABOVE AND BELOW.
      *--------------------------------
       DISPLAY-ALL-FIELDS.

           DISPLAY " ".
           PERFORM DISPLAY-VENDOR-NUMBER.
           PERFORM DISPLAY-VENDOR-NAME.
           PERFORM DISPLAY-VENDOR-ADDRESS-1.
           PERFORM DISPLAY-VENDOR-ADDRESS-2.
           PERFORM DISPLAY-VENDOR-CITY.
           PERFORM DISPLAY-VENDOR-STATE.
           PERFORM DISPLAY-VENDOR-ZIP.
           PERFORM DISPLAY-VENDOR-CONTACT.
           PERFORM DISPLAY-VENDOR-PHONE.
           DISPLAY " ".
       
       DISPLAY-VENDOR-NUMBER.
           DISPLAY " VENDOR NUMBER: " VENDOR-NUMBER.

       DISPLAY-VENDOR-NAME.
           DISPLAY "1. VENDOR NAME: " VENDOR-NAME.

       DISPLAY-VENDOR-ADDRESS-1.
           DISPLAY "2. VENDOR ADDRESS-1: " VENDOR-ADDRESS-1.

       DISPLAY-VENDOR-ADDRESS-2.
           DISPLAY "3. VENDOR ADDRESS-2: " VENDOR-ADDRESS-2.

       DISPLAY-VENDOR-CITY.
           DISPLAY "4. VENDOR CITY: " VENDOR-CITY.

       DISPLAY-VENDOR-STATE.
           DISPLAY "5. VENDOR STATE: " VENDOR-STATE.

       DISPLAY-VENDOR-ZIP.
           DISPLAY "6. VENDOR ZIP: " VENDOR-ZIP.

       DISPLAY-VENDOR-CONTACT. 
           DISPLAY "7. VENDOR CONTACT: " VENDOR-CONTACT.

       DISPLAY-VENDOR-PHONE.
           DISPLAY "8. VENDOR PHONE: " VENDOR-PHONE.






