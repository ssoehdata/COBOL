000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. EIGER04.
000300 ENVIRONMENT DIVISION.
000400 DATA DIVISION.
000500
000600 WORKING-STORAGE SECTION.
000700
000800 01 THE-MESSAGE PIC X(50).
000900 01 THE-NUMBER PIC 9(2).
001000 01 A-SPACE PIC X.
001100
001200 PROCEDURE DIVISION.
001300 PROGRAM-BEGIN.
001400
001500* Initialize the space variable
001600     MOVE " " TO A-SPACE.
001700* Start THE-NUMBER at 0
001800     MOVE 0 TO THE-NUMBER.
001900
002000* Set up and display line 1
002100     MOVE "There once was a lady from Eiger,"
002200     TO THE-MESSAGE.
002300     PERFORM ADD-NUMBER-AND-DISPLAY.
002400
002500* Set up and Display line 2
002600     MOVE "Who smiled and rode forth on a tiger."
002700     TO THE-MESSAGE.
002800     PERFORM ADD-NUMBER-AND-DISPLAY.
002900
003000* Set up and display line 3
003100     MOVE "They returned from the ride" TO THE-MESSAGE.
003200     PERFORM ADD-NUMBER-AND-DISPLAY.
003300
003400* Set up and display line 4
003500     MOVE "With the lady inside," TO THE-MESSAGE.
003600     PERFORM ADD-NUMBER-AND-DISPLAY.
003700
003800* Set up and display line 5
003900     MOVE "And the smile on the face of the tiger." 
004000         TO THE-MESSAGE.
004100     PERFORM ADD-NUMBER-AND-DISPLAY.
004200
004300 PROGRAM-DONE.
004400     STOP RUN.
004500
004600 ADD-NUMBER-AND-DISPLAY.
004700     ADD 1 TO THE-NUMBER.
004800     DISPLAY
004900     THE-NUMBER
005000     A-SPACE
005100     THE-MESSAGE.

      * Simolifies example 3_8 by creating a paragraph that combines
      * and simplifies operations(reduces repetition /DRY principle):
      * 
      *    ADD-NUMBER-AND-DISPLAY.
      *    ADD 1 TO THE-NUMBER 
      *    DISPLAY THE-NUMBER A-SPACE THE-MESSAGE.

      * Using the above paragraph with PERFORM operations inserted 
      * at the appropriate locations.
      * In essence, JUMP operations are used.


