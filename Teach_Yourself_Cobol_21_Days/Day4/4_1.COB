      * This program asks for a Y or N answer, and then displays
      * whether the user chose yes or no.


000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. YESNO01.
000300 ENVIRONMENT DIVISION.
000400 DATA DIVISION.
000500 WORKING-STORAGE SECTION. 
000600 
001100 01  YES-OR-NO       PIC X.
000700 PROCEDURE DIVISION. 
000800 PROGRAM-BEGIN.
           PERFORM GET-THE-ANSWER.

           PERFORM DISPLAY-THE-ANSWER.
000900
001000 PROGRAM-DONE.
001100     STOP-RUN.
       GET-THE-ANSWER.

           DISPLAY "Is the answer Yes or No? (Y/N)".
           ACCEPT YES-OR-NO.

       DISPLAY-THE-ANSWER.
           IF YES-OR-NO IS EQUAL "Y" 
               DISPLAY " You answered Yes.".
           IF YES-OR-NO IS EQUAL "N" 
               DISPLAY "You answered No.".
           
           