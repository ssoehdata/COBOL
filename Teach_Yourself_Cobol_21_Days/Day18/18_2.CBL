      * The top logic in vndrpt03.cbl 
       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 

           PERFORM OPENING-PROCEDURE. 
           MOVE ZEROS TO LINE-COUNT  
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
           