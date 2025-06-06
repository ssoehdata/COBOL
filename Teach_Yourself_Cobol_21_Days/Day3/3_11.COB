      * Structured Version for the Eiger05 progam

      * Compared to previous version (Example 3_9), this version makes
      * use not only of paragraphs to reduce repeating code, but also
      * use paragraphs to break out and document which parts of the code
      * are for initializing or setting up variables before the main
      * logic and  which parts are the main logic of the code.

000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. EIGER06.
000300
000400* This program illustrates nested PERFORMS in a
000500* Structured program.
000600 ENVIRONMENT DIVISION.
000700 DATA DIVISION.
000800
000900 WORKING-STORAGE SECTION.
001000
001100 01 THE-MESSAGE PIC X(50).
001200 01 THE-NUMBER PIC 9(2).
001300 01 A-SPACE PIC X.
001400
001500 PROCEDURE DIVISION.
001600
001700* LEVEL 1 ROUTINES
001800 PROGRAM-BEGIN.
001900
002000     PERFORM PROGRAM-INITIALIZATION.
002100     PERFORM MAIN-LOGIC.
002200
002300 PROGRAM-DONE.
002400     STOP RUN.
002500
002600*LEVEL 2 ROUTINES
002700 PROGRAM-INITIALIZATION.
002800* Initialize the space variable
002900     MOVE " " TO A-SPACE.
003000* Start THE-NUMBER at 0
003100     MOVE 0 TO THE-NUMBER.
003200
003300 MAIN-LOGIC.
003400* Set up and display line 1
003500     MOVE "There once was a lady from Eiger,"
003600         TO THE-MESSAGE.
003700     PERFORM ADD-NUMBER-AND-DISPLAY.
003800
003900* Set up and Display line 2
004000     MOVE "Who smiled and rode forth on a tiger."
004100         TO THE-MESSAGE.
004200     PERFORM ADD-NUMBER-AND-DISPLAY.
004300
004400* Set up and display line 3
004500     MOVE "They returned from the ride" TO THE-MESSAGE.
004600     PERFORM ADD-NUMBER-AND-DISPLAY.
004700
004800* Set up and display line 4
004900     MOVE "With the lady inside," TO THE-MESSAGE.
005000     PERFORM ADD-NUMBER-AND-DISPLAY.
005100    
005200* Set up and display line 5
005300     MOVE "And the smile on the face of the tiger."
005400         TO THE-MESSAGE.
005500     PERFORM ADD-NUMBER-AND-DISPLAY.
005600
005700* LEVEL 3 ROUTINES
005800* This paragraph is PERFORMED 5 times from within
005900* MAIN-LOGIC.
006000
006100 ADD-NUMBER-AND-DISPLAY.
006200     ADD 1 TO THE-NUMBER.
006300     DISPLAY
006400         THE-NUMBER
006500         A-SPACE
006600         THE-MESSAGE.
006700

  

