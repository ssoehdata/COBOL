000100*in-line procedures 
000200
000300*awk -i inplace '{printf("%04d00%s\n", NR, substr($0,7,120)) }' filename.cob
000400 IDENTIFICATION DIVISION. 
000500 PROGRAM-ID.  INLINEPROCEDURES.
000600 DATE-WRITTEN.  19-10-2024.
000700 DATE-COMPILED. 19-10-2024.
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
002200 77  LS_COUNTER          PIC s9999 VALUE 0. 
002300 PROCEDURE DIVISION. 
002400     000-BEGIN.
002500         DISPLAY "DEBUGGING TEXT: IF DISPLAYED, PROGRAM RUNNING." 
002600
002700*         PERFORM 3 TIMES 
002800*             DISPLAY "Inside simple perform"
002900*            DISPLAY "still inside the perform"
003000*             ADD 1 TO LS_COUNTER 
003100*             DISPLAY "IN A LOOP: ", LS_COUNTER 
003200*         END-PERFORM.
003300
003400         PERFORM 010-PROCEDURE1. 
003500
003600
003700         DISPLAY "COUNTING UPWARDS..."
003800         PERFORM VARYING WS_COUNTER FROM 1 UNTIL WS_COUNTER 
003900             IS GREATER THAN 4
004000             DISPLAY "COUNTER VALUE IS ", WS_COUNTER
004100         END-PERFORM.
004200
004300         DISPLAY "COUNTING DOWN NOW..."
004400         PERFORM VARYING WS_COUNTER FROM 4 BY -1 UNTIL WS_COUNTER
004500             IS LESS THAN 0           
004600             DISPLAY "COUNTER VALUE IS ", WS_COUNTER
004700         END-PERFORM.   
004800
004900         PERFORM VARYING WS_COUNTER FROM 1 BY 1 UNTIL WS_COUNTER 
005000                 IS GREATER THAN 5
005100           PERFORM 010-PROCEDURE1 
005200         END-PERFORM.       
005300
005400   
005500         DISPLAY "PROGRAM ENDING"   
005600
005700         STOP RUN.
005800         
005900         010-PROCEDURE1.
006000             DISPLAY "I'm in " WITH NO ADVANCING
006100             DISPLAY "Procedure 1"
                   PERFORM 100-PROCEDURE2.

               100-PROCEDURE2.
                   DISPLAY "I'm now in Procedure 2".  
                    
006200
006300 END PROGRAM INLINEPROCEDURES.
