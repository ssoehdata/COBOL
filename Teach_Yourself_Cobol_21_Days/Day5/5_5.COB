      * Pausing after 15 lines 
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. MULT04. 
      ************************************************************
      * The display is paused after each 15 lines. 
      * The program asks the user for a number, multiplication table
      * and a table size, then displays the values 1 through users 
      * choice for HOW-MANY.
      *************************************************************
       ENVIRONMENT DIVISION. 
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 

       01  THE-NUMBER                  PIC 99. 
       01  THE-MULTIPLIER              PIC 999.
       01  THE-PRODUCT                 PIC 9999.
       01  HOW-MANY                    PIC 99. 
       01  SCREEN-LINES                PIC 99. 

       01  A-DUMMY                     PIC X. 

       PROCEDURE DIVISION. 
      * LEVEL 1 ROUTINES 
       PROGRAM-BEGIN. 
           PERFORM PROGRAM-INTIALIZATION. 
           PERFORM GET-TABLE-DATA. 
           PERFORM DISPLAY-THE-TABLE. 

       PROGRAM-DONE. 
           STOP RUN. 
      * LEVEL 2 ROUTINES 
       PROGRAM-INTIALIZATION.
           MOVE 0 TO THE-MULTIPLIER. 
           MOVE 0 TO SCREEN-LINES. 
       GET-TABLE-DATA. 
           DISPLAY  
           "Which multiplication table (01-99)?".
           ACCEPT THE-NUMBER. 

           DISPLAY "How many entries would you like (01-99)?".
           ACCEPT HOW-MANY. 

       DISPLAY-THE-TABLE.
           DISPLAY "The  "THE-NUMBER" 's table is:".
           PERFORM CALCULATE-AND-DISPLAY HOW-MANY TIMES. 

      * LEVEL 3 ROUTINES.
       CALCULATE-AND-DISPLAY. 
           ADD 1 TO THE-MULTIPLIER. 
           COMPUTE THE-PRODUCT = THE-NUMBER * THE-MULTIPLIER. 
           DISPLAY    
               THE-NUMBER " * " THE-NUMBER " = " THE-MULTIPLIER.

           ADD 1 TO SCREEN-LINES. 
           IF SCREEN-LINES = 15 
               DISPLAY "Press ENTER to continue..."
               ACCEPT A-DUMMY 
               MOVE 0 TO SCREEN-LINES. 



       