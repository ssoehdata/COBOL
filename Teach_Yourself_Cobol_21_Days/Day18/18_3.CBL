      * Using EXIT PROGRAM and STOP RUN in the same program.
       PROCEDURE-DIVISION. 
       PROGRAM-BEGIN. 
           
           PERFORM OPENING-PROCEDURE. 
           MOVE ZEROS TO   LINE-COUNT 
                           PAGE-NUMBER. 
           
           PERFORM START-NEW-PAGE. 

           MOVE "N" TO FILE-AT-END. 
           PERFORM READ-NEXT-RECORD.
           IF FILE-AT-END = "Y" 
               MOVE "NO RECORDS FOUND" TO PRINTER-RECORD 
               PERFORM WRITE-TO-PRINTER
           ELSE 
009300             PERFORM PRINT-VENDOR-FIELDS 
                   UNTIL FILE-AT-END = "Y".

           PERFORM CLOSING-PROCEDURE. 

009500     PROGRAM-EXIT.
009600           EXIT PROGRAM. 
009700       
009800 PROGRAM-DONE.
           STOP RUN. 

               
      *After the main logic of the program is completed, 
      *the program executes the logic in the PROGRAM-EXIT 
      *paragraph at line 009500. This performs an EXIT PROGRAM 
      *at line 009600. 
      *The COBOL program checks to see whether it is a 
      *called program. If it is, it returns to the calling program 
      *immediately, and the paragraph at line 
      *009800 containing STOP RUN is never executed. 

      *If the program   is not a called program, EXIT PROGRAM 
      *is ignored and the 
      *program continues to lines 009700 and 009800, 
      *where the STOP RUN is executed and the program halts.

      *(This approach to exiting and stopping is so workable you 
      *can include it in your standard COBOL shell. It works for
      * a called or calling program and you don't need to worry 
      *about how a program will be used.