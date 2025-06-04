      * Starting on the first record of a new key 
       MOVE VENDOR-FILE 
           KEY NOT < VENDOR-NAME 
               INVALID KEY 
                   MOVE "Y" TO FILE-AT-END. 
                    
                