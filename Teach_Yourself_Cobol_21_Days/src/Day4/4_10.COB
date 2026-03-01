000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. MENU01.
000300*------------------------------------------------
000400* This program displays a three choice menu of messages that can
      * be displayed. The user enters the choice, 1, 2 or 3, and the
      * appropriate message is displayed. An error message is displayed
      * if an invalid choice is made.
001000*------------------------------------------------
001100 ENVIRONMENT DIVISION.
001200 DATA DIVISION.
001300 WORKING-STORAGE SECTION.
001400
001500 01 MENU-PICK PIC 9.
001600
001700 PROCEDURE DIVISION.
001800 PROGRAM-BEGIN.
001900
002000     PERFORM GET-THE-MENU-PICK.
002100
002200     PERFORM DO-THE-MENU-PICK.
002300
002400 PROGRAM-DONE.
002500 STOP RUN.
002600
002700* LEVEL 2 ROUTINES
002800 GET-THE-MENU-PICK.
002900
003000     PERFORM DISPLAY-THE-MENU.
003100     PERFORM GET-THE-PICK.
003200    
003300 DO-THE-MENU-PICK.
003400     IF MENU-PICK < 1 OR
003500     MENU-PICK > 3
003600     DISPLAY "Invalid selection".
003700
003800     IF MENU-PICK = 1
003900     DISPLAY "One for the money.".
004000     
004100     IF MENU-PICK = 2
004200     DISPLAY "Two for the show.".
004300     
004400     IF MENU-PICK = 3
004500     DISPLAY "Three to get ready.".
004600
004700* LEVEL 3 ROUTINES
004800 DISPLAY-THE-MENU.
004900     DISPLAY "Please enter the number of the message".
005000     DISPLAY "that you wish to display.".
005100* Display a blank line
005200     DISPLAY " ".
005300     DISPLAY "1. First Message".
005400     DISPLAY "2. Second Message".
005500     DISPLAY "3. Third Message".
005600* Display a blank line
005700     DISPLAY " ".
005800     DISPLAY "Your selection (1-3)?".
005900
006000 GET-THE-PICK.
006100     ACCEPT MENU-PICK.
006200
