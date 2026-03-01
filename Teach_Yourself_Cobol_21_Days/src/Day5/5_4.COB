      * This program adjusts the previous program 5_3 to allow for the 
      * user to define the number of times to perform the calculation
      * instead of setting it to a predetermined value (e.g. 12)
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. MULT03. 
       ENVIRONMENT DIVISION.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 

       01  THE-NUMBER              PIC 99. 
       01  THE-MULTIPLIER          PIC 999. 
       01  THE-PRODUCT             PIC 9999. 
       01  HOW-MANY                PIC 99. 

       PROCEDURE DIVISION. 
      * LEVEL 1 ROUTINES 
       PROGRAM-BEGIN.
           PERFORM PROGRAM-INITIALIZATION. 
           PERFORM GET-TABLE-DATA. 
           PERFORM DISPLAY-THE-TABLE. 

       PROGRAM-DONE. 
           STOP RUN. 
      * LEVEL 2 ROUTINES 
       PROGRAM-INITIALIZATION. 
           MOVE 0 TO THE-MULTIPLIER. 

       GET-TABLE-DATA. 
           DISPLAY    
           "Which multiplication table (01-99)?". 
           ACCEPT THE-NUMBER. 


           DISPLAY "How many entries would you like (01-99)?".
           ACCEPT HOW-MANY. 

       DISPLAY-THE-TABLE. 
           DISPLAY "The THE-NUMBER 's table is:".
            
           PERFORM CALCULATE-AND-DISPLAY HOW-MANY TIMES. 

      * LEVEL 3 ROUTINES 
       CALCULATE-AND-DISPLAY.
           ADD 1 TO THE-MULTIPLIER. 
           COMPUTE THE-PRODUCT = THE-NUMBER * THE-MULTIPLIER. 
           DISPLAY 
               THE-NUMBER " * " THE-MULTIPLIER " = " THE-PRODUCT. 
      