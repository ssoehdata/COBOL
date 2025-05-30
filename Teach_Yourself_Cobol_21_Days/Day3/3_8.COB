000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. EIGER03.
000300 ENVIRONMENT DIVISION.
000400 DATA DIVISION.
000500
000600 WORKING-STORAGE SECTION. 
000700 
000080 01  THE-MESSAGE                 PIC X(50).
000900 01  THE-NUMBER                  PIC 9(2).
001000 01  A-SPACE                     PIC X.
001100 
001200 PROCEDURE DIVISION.
001300 PROGRAM-BEGIN. 
001400
001500* Intitialize the space variable. 
001600     MOVE " " TO A-SPACE. 
001700* Start THE-NUMBER at 0.
001800     MOVE 0 TO THE-NUMBER.
001900
002000* Set up and display line 1
002100     MOVE "There onece was a lady from Eiger," 
002200     TO THE-MESSAGE.
002300     ADD 1 TO THE-NUMBER. 
002400     DISPLAY
002500     THE-NUMBER
002600     A-SPACE 
002700     THE-MESSAGE. 
002800
002900* Set up and Display line 2 
003000     MOVE "Who smiled and rode forth on a tiger."
003100     TO THE-MESSAGE.
003200     ADD 1 TO THE-NUMBER
003300     DISPLAY
003400         THE-NUMBER
003500         A-SPACE        
003600         THE-MESSAGE.
003700
003800* Set up and display line 3
003900     MOVE "They  returned from the ride" TO THE-MESSAGE.
004000     ADD 1 TO THE-NUMBER.
004100     DISPLAY  
004200         THE-NUMBER 
004300         A-SPACE 
004400         THE-MESSAGE. 
004500 
004600* Set up and display line 4 
004700     MOVE "With the lady inside," TO THE-MESSAGE.
004800     ADD 1 TO THE-NUMBER. 
004900     DISPLAY  
005000         THE-NUMBER 
005100         A-SPACE 
005200         THE-MESSAGE. 
005300       
005400* Set up and display line 5 
005500     MOVE " And the smile on the the face of the tiger."
005600         TO THE-MESSAGE.
005700         ADD 1 TO THE-NUMBER. 
005800         DISPLAY   
005900             THE-NUMBER 
006000             A-SPACE  
006100             THE-MESSAGE. 
006200        
006300
006400     PROGRAM-DONE. 
006500         STOP RUN. 


