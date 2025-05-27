      * Looking Up Records in Indexed Files 
      * Using READ to retrieve vendor record 
       PERFORM ENTER-VENDOR-NUMBER. 
       MOVE "Y" TO RECORD-FOUND. 
       READ VENDOR-FILE RECORD 
           INVALID KEY 
               MOVE "N" TO RECORD-FOUND. 
               