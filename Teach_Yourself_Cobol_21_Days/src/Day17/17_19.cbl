      * Starting  partly through the key path 

       MOVE "AZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" TO VENDOR-NAME.
       START VENDOR-FILE
           KEY > VENDOR-NAME
               INVALID KEY
                   MOVE "Y" TO FILE-AT-END.
                   