       IDENTIFICATION DIVISION. 
       PROGRAM-ID. WRDSTR02.
      * this program accepts 2 words from the user then displays them
      * in  REVERSE ASCII order compared to 4_5. 
       ENVIRONMENT DIVISION. 
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  WORD-1                      PIC X(50).
       01  WORD-2                      PIC X(50).

       PROCEDURE DIVISION. 
       PROGRAM-BEGIN.
           PERFORM INTITIALIZE-PROGRAM. 
           PERFORM ENTER-THE-WORDS. 
           PERFORM DISPLAY-THE-WORDS. 
       PROGRAM-DONE. 
      * Level 2 routines 
       INTITIALIZE-PROGRAM.
           MOVE " " TO WORD-1.
           MOVE " " TO WORD-2. 

       ENTER-THE-WORDS. 
           DISPLAY "This program will accept 2 words,".
           DISPLAY  "and then display them".
           DISPLAY   "in ASCII order.".

           DISPLAY "Please enter the first word."
           ACCEPT WORD-1. 
           
           DISPLAY "Please enter the second word.".
           ACCEPT WORD-2. 
       
       DISPLAY-THE-WORDS. 
           DISPLAY "The words sorted in ASCII order are:"
           IF WORD-1 < WORD-2 
               DISPLAY WORD-1 
               DISPLAY WORD-2.

           IF WORD-1 NOT < WORD-2
               DISPLAY WORD-2
               DISPLAY WORD-1.

       