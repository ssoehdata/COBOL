      * Include program exit logic in file stcrpt02.cbl 
       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 

           PERFORM OPENING-PROCEDURE. 

           MOVE ZEROES TO  LINE-COUNT  
                           PAGE-NUMBER. 

           PERFORM START-NEW PAGE. 

           MOVE "N" TO FILE-AT-END. 
           PERFORM READ-NEXT-REECORD. 
           IF FILE-AT-END = "Y" 
                   MOVE "NO RECORDS FOUND" TO PRINTER-RECORD 
                   PERFORM WRITE-TO-PRINTER 
           ELSE 
               PERFORM PRINT-STATE-FIELDS 
                   UNTIL FILE-AT-END = "Y".

               PERFORM CLOSING-PROCEDURE. 

       PROGRAM-EXIT.
           EXIT PROGRAM. 

       PROGRAM-DONE. 
           STOP RUN. 
           