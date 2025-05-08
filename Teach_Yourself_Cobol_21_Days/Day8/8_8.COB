 
      *    Nested Structure Variables 
      * Structures within structure 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. JACK06. 
       ENVIRONMENT DIVISION.
       DATA DIVISION. 
       WORKING-STORAGE SECTION.

       01  THE-WHOLE-MESSAGE.                
           05  THE-NUMBER                  PIC 9(2)  VALUE 1. 
           05  A-SPACE                     PIC X     VALUE SPACE.
           05  THE-MESSAGE. 
                   10 JACKS-NAME           PIC X(5)   VALUE  "JACK".
                   10 JACKS-TASK           PIC X(45). 

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN. 
       
      * Set up and display line 1 
           MOVE "be nimble," TO JACKS-TASK. 
           DISPLAY THE-WHOLE-MESSAGE. 

      * Set up and display line 2 
           MOVE "be quick," TO JACKS-TASK.
           ADD 1 TO THE-NUMBER. 
           DISPLAY THE-WHOLE-MESSAGE.   
      
      *Set up and display line 3 
           MOVE "jump over the candlestick." TO JACKS-TASK. 
           ADD 1 TO THE-NUMBER. 
           DISPLAY THE-WHOLE-MESSAGE. 

      * Display a closing message 
           MOVE "That's all folks" TO THE-WHOLE-MESSAGE. 
           DISPLAY THE-WHOLE-MESSAGE. 

       PROGRAM-DONE. 
           STOP RUN. 
      
       

           