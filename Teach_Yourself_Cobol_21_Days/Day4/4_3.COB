000100 IDENTIFICATION DIVISION. 
000200 PROGRAM-ID. YESNO03.
000300***************************************************************
004000* This program demonstrates IF statement control flow.
005000* The program asks for a Y or N answer, then displays whether
000600* the user chose yes or no.
000700* The edit logic allows for entry of Y, y, N, or n. 
000800 ENVIRONMENT DIVISION.
000900 DATA DIVISION.
001000 WORKING-STORAGE SECTION.
001100
001200 01 YES-OR-NO PIC X.
001300
001400 PROCEDURE DIVISION.
001500 PROGRAM-BEGIN.
001600
001700 PERFORM GET-THE-ANSWER.
001800
001900 PERFORM EDIT-THE-ANSWER.
002000
002100 PERFORM DISPLAY-THE-ANSWER.
002200
002300 PROGRAM-DONE.
002400 STOP RUN.
002500
002600 GET-THE-ANSWER.
002700
002800 DISPLAY "Is the answer Yes or No? (Y/N)".
002900 ACCEPT YES-OR-NO.
003000
003100 EDIT-THE-ANSWER.
003200
003300 IF YES-OR-NO IS EQUAL "y"
003400 MOVE "Y" TO YES-OR-NO.
003500
003600 IF YES-OR-NO IS EQUAL "n"
003700 MOVE "N" TO YES-OR-NO.
003800
003900 DISPLAY-THE-ANSWER.
004000 IF YES-OR-NO IS EQUAL "Y"
004100 PERFORM IT-IS-VALID
004200 DISPLAY "You answered Yes.".
004300
004400 IF YES-OR-NO IS EQUAL "N"
004500 PERFORM IT-IS-VALID
004600 DISPLAY "You answered No.".
004700
004800 IT-IS-VALID.
004900 DISPLAY "Your answer is valid and".

      *When the IF at line 004400 tests true, lines 004100 and 004200 
      *are executed, one after the other. Line 004100 is a PERFORM 
      *request that causes a message to be displayed at line
      *004900. A similar action happens when the IF at 
      *line 004000 tests true and lines 004500 and 004600 are executed.
      
