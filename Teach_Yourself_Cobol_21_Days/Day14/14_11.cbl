      * Deleting Records in Indexed Fields 

      * Using DELETE to remove a record. 

           PERFORM ENTER-VENDOR-NUMBER. 
           PERFORM READ-VENDOR-RECORD.
           IF RECORD-FOUND = "Y"
               PERFORM DELETE-VENDOR-RECORD. 

       READ-VENDOR-RECORD. 
           MOVE "Y" TO RECORD-FOUND. 
           READ VENDOR-FILE RECORD 
               INVALID KEY 
                   MOVE "N" TO RECORD-FOUND. 

       DELETE-VENDOR-RECORD. 
           DELETE VENDOR-FILE RECORD
               INVALID KEY 
               DISPLAY "ERROR DELETING VENDOR RECORD".
               