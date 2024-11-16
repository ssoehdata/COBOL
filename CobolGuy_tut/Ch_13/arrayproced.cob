000100*processing an array with a procedure
000200
000300*awk -i inplace '{printf("%04d00%s\n", NR, substr($0,7,120)) }' filename.cob
000400 IDENTIFICATION DIVISION. 
000500 PROGRAM-ID.  ARRAYPROCEDURE.
000600 DATE-WRITTEN.  21-10-2024.
000700 DATE-COMPILED. 21-10-2024.
000800 AUTHOR. 
000900 ENVIRONMENT DIVISION.
001000  CONFIGURATION SECTION.
001100  SOURCE-COMPUTER. LINUXMINT21.
001200  OBJECT-COMPUTER. LINUXMINT21.
001300  INPUT-OUTPUT SECTION.
001400  FILE-CONTROL.
001500 DATA DIVISION. 
001600  FILE SECTION.
001700 WORKING-STORAGE SECTION.
001800*    need to add 's' for signed in front of pic clause for neg 
001900*    values in loop , and to obtain "0" counter
002000 77  WS_COUNTER          PIC s9999 VALUE 0.
002100 LOCAL-STORAGE SECTION.
002200*local storage section mem reallocated each time a func is called.
002300 77  LS_COUNTER          PIC s9999 VALUE 0. 
002400 77  myArray     PIC 9(3)  OCCURS 10 times indexed by myArray-Ctr.
002500 PROCEDURE DIVISION. 
002600     000-BEGIN.
002700         DISPLAY "DEBUGGING TEXT: IF DISPLAYED, PROGRAM RUNNING." 
002800
002900*         PERFORM 3 TIMES 
003000*             DISPLAY "Inside simple perform"
003100*            DISPLAY "still inside the perform"
003200*             ADD 1 TO LS_COUNTER 
003300*             DISPLAY "IN A LOOP: ", LS_COUNTER 
003400*         END-PERFORM.
003500
003600         PERFORM 010-PROCEDURE1. 
003700
003800
003900         DISPLAY "COUNTING UPWARDS..."
004000         PERFORM VARYING WS_COUNTER FROM 1 UNTIL WS_COUNTER 
004100             IS GREATER THAN 4
004200             DISPLAY "COUNTER VALUE IS ", WS_COUNTER
004300         END-PERFORM.
004400
004500         DISPLAY "COUNTING DOWN NOW..."
004600         PERFORM VARYING WS_COUNTER FROM 4 BY -1 UNTIL WS_COUNTER
004700             IS LESS THAN 0           
004800             DISPLAY "COUNTER VALUE IS ", WS_COUNTER
004900         END-PERFORM.   
005000
005100         PERFORM VARYING WS_COUNTER FROM 1 BY 1 UNTIL WS_COUNTER 
005200                 IS GREATER THAN 5
005300           PERFORM 010-PROCEDURE1 
005400         END-PERFORM.   
005500          
005600         PERFORM 010-PROCEDURE3 THRU 010-PROCEDURE3-END.
005700         PERFORM 010-PROCEDURE4 THRU 010-PROCEDURE4-END. 
005800* repeating the procedure to demonstrate the value of using 
005900* procedures,i.e. you don`t need to rewrite the code but can 
006000* merely call the same procedure again.
006100         PERFORM 010-PROCEDURE4 THRU 010-PROCEDURE4-END.              
006200*    loop that processes contents of an array        
006300         PERFORM VARYING myARRAY-Ctr FROM 1 BY 1 UNTIL 
006400                myARRAY-Ctr IS GREATER THAN 9
006500                  COMPUTE myARRAY(myARRAY-Ctr) = myARRAY-Ctr * 22
006600                  MOVE myARRAY-Ctr TO WS_COUNTER
006700                  DISPLAY "Contents of myARRAY at " WS_COUNTER, 
006800                     " is " myARRAY(myARRAY-Ctr)
006900         END-PERFORM.
007000
007100
007200         DISPLAY "PROGRAM ENDING"   
007300
007400         STOP RUN.
007500         
007600         010-PROCEDURE1.
007700             DISPLAY "I'm in " WITH NO ADVANCING
007800             DISPLAY "Procedure 1"
007900             PERFORM 100-PROCEDURE2.
008000
008100         100-PROCEDURE2.
008200             DISPLAY "I'm now in Procedure 2".  
008300         100-PROCEDURE2-END.
008400* end procedure 2
008500* procedure 3 populates the array
008600         010-PROCEDURE3.                                      
008700             PERFORM varying myARRAY-Ctr from 1 by 1 until 
008800                 myARRAY-Ctr is greater than 9
008900                  compute myArray(myARRAY-Ctr) = myARRAY-Ctr * 22
009000                  move myARRAY-Ctr to WS_Counter                        
009100             END-PERFORM.
009200         010-PROCEDURE3-END.  
009300
009400* procedure 4 displays the array
009500         010-PROCEDURE4.
009600             PERFORM varying myARRAY-Ctr from 1 by 1 until 
009700                 myARRAY-Ctr is greater than 9                        
009800                  DISPLAY "Contents of myARRAY at ", WS_COUNTER,
009900                     " is " myARRAY(myARRAY-Ctr)
010000             END-PERFORM. 
010100
010200         010-PROCEDURE4-END.
010300              
010400
010500 END PROGRAM ARRAYPROCEDURE.
010600
010700
