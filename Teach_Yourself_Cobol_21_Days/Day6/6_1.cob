      * Initializing Variables 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. JACK04. 
       ENVIRONMENT DIVISION. 
       DATA DIVISION. 

       WORKING-STORAGE SECTION. 

       01  THE-MESSAGE                 PIC X(50). 
       01  THE-NUMBER                  PIC 9(2)    VALUE IS 1.
       01  A-SPACE                     PIC X       VALUE IS " ".

       PROCEDURE DIVISION.
       PROGRAM-BEGIN. 
      * Set up and display line 1 
           ADD 1 TO THE-NUMBER.
           MOVE "Jack be nimble," TO THE-MESSAGE. 
           DISPLAY    
               THE-NUMBER 
               A-SPACE 
               THE-MESSAGE. 

      * Set up and display line 2 
           ADD 1 TO THE-NUMBER.
           MOVE "Jack be quick," TO THE-MESSAGE. 
           DISPLAY    
               THE-NUMBER 
               A-SPACE 
               THE-MESSAGE. 
      * Set up and display line 3 
           ADD 1 TO THE-NUMBER. 
           MOVE "Jack jump over the candlestick." TO THE-MESSAGE. 
           DISPLAY    
               THE-NUMBER 
               A-SPACE 
               THE-MESSAGE. 
       PROGRAM-DONE.
           STOP RUN. 

           
      * Compare this file to 2_10 and notice that two of the MOVE 
      * statements in the PROCEDURE DIVISION are now not needed 
      * (lines 16 and 19) because of the initializers in the 
      * WORKING-STORAGE section. 

      * To create a default value for a variable, initialize it 
      * in WORKING-STORAGE. 


      *Note an undefined value can contain any value. 
      * For numeric variables, this might cause problems that are not 
      * detected at compile time. e.g. DISPLAY (ADD 1) to a statement
      * with a numeric variable that contains an undefined value may
      * produce an error. 
