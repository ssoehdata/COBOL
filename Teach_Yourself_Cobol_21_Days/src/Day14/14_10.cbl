      * Changing Records in Indexed Files 
      * Using REWRITE to change a record. 
           PERFORM ENTER-VENDOR-NUMBER.  
           PERFORM READ-VENDOR-RECORD. 
           IF RECORD-FOUND = "Y"
               PERFORM LOAD-NEW-VENDOR-DATA 
               PERFORM REWRITE-VENDOR-RECORD. 

       READ-VENDOR-RECORD. 
           MOVE "Y" TO RECORD-FOUND.
           READ VENDOR-FILE RECORD 
               INVALID KEY 
                   MOVE "N" TO RECORD-FOUND. 

       REWRITE-VENDOR-RECORD. 
           REWRITE VENDOR-RECORD 
               INVALID KEY 
               DISPLAY "ERROR REWRITING VENDOR RECORD".
       